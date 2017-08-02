close all
clear all
more off
%written by Garr, modified by Savanna: 2017
addpath("../OpenPV/mlab/util")
graphics_toolkit("gnuplot")
setenv("GNUTERM","X11")

nbatch = 8;
batchwidth = 1;

parent_output_dir = '/nh/compneuro/scratch/starOut/starField_SPM_9X9X16_5_500/train18-01-17_2';
output_dir = parent_output_dir;
write_to = '~/Star-Field-Transformations/starOut/8-01-17_2/';
mkdir(write_to);
i_batchsweep = 1;
batchsweep_format_str = "%02d";
if batchwidth > 1
  output_dir = [parent_output_dir, filesep, 'batchsweep_', num2str(i_batchsweep-1,batchsweep_format_str)];
endif

if batchwidth > 1
  batchsweep_str = "_0";
else
  batchsweep_str = "";
endif

%%%%%%%%%%%%%%% MUGGLE RECONSTRUCTION SUBPLOTS 
for i_frame = 0 : 1 : 31
for frameRecon_step = 0:0
  if ~exist([output_dir, filesep, 'Frame', "_", num2str(i_frame), batchsweep_str, '.pvp'])
    break
  endif
  if frameRecon_step == 0 
    [frame_data_pvp, frame_hdr] = readpvpfile([output_dir, filesep, 'Frame', "_", num2str(i_frame), batchsweep_str, '.pvp']);
  endif
  if frameRecon_step == 0 && i_frame == 0
    frameRecon_time = frame_data_pvp{ceil(frame_hdr.nbands)}.time;
    frameRecon_nbands = frame_hdr.nbands;
  endif
    disp(frameRecon_nbands); disp(" "); disp(frameRecon_step);
  title_str = ['Frame', "_", num2str(i_frame), batchsweep_str, "_",  num2str(frameRecon_time), '_', num2str(frameRecon_step)];
  fh_frame = figure("name", title_str);
  subplot(2,1,1)
  title('Frame');
  frame_data = permute(frame_data_pvp{ceil(frameRecon_nbands-frameRecon_step)}.values,[2,1,3]);
  frame_data = floor(255*(frame_data - min(frame_data(:))) / (max(frame_data(:) - min(frame_data(:)))));
  imagesc(uint8((frame_data)));
  box off
  axis off
  axis image
  frame_recon_array = uint8(zeros([size(frame_data,1),size(frame_data,2),1]));
  frame_recon_array(1:size(frame_data,1),1:size(frame_data,2),:) = uint8(frame_data);


  if frameRecon_step == 0 
    [frameReconS1_data,frameeReconS1_hdr] = readpvpfile([output_dir, filesep, 'Frame', "_", num2str(i_frame), 'ReconS1Muggle', batchsweep_str, '.pvp']);
  endif
  subplot(2,1,2)
  title('S1');
  frame_data = permute(frameReconS1_data{ceil(frameRecon_nbands-frameRecon_step)}.values,[2,1,3]);
  frame_data = floor(255*(frame_data - min(frame_data(:))) / (max(frame_data(:) - min(frame_data(:)))));
  imagesc(uint8((frame_data)));
  box off
  axis off
  axis image
  frame_recon_array(size(frame_data,1)+1:2*size(frame_data,1),1:size(frame_data,2),:) = uint8(frame_data);

imwrite(frame_recon_array, [write_to, filesep, title_str, '.png'], 'png');

endfor %% frameRecon_step
endfor %% i_frame


%%%%%%%%%%% MUGGLE FEATURE ACTIVATIONS %%%%%%%%%%
num_LCA_layers = 1;
VThresh = ones(1, num_LCA_layers);
VThresh = .05*VThresh;
VThresh_bins = cell(1, num_LCA_layers);
for i_LCA = 2:num_LCA_layers
  VThresh(i_LCA) *= (0.5^(i_LCA-1));
endfor
for i_LCA = 1:num_LCA_layers
  VThresh_bins{i_LCA} = VThresh(i_LCA)*[0:0.25:5]; % why is this only to 5?
endfor

for i_LCA = 1 : num_LCA_layers
  if batchwidth > 1
    LCA_glob = glob([output_dir, filesep, 'S', num2str(i_LCA), "Muggle", '_', '[0-9]', '_', '0', '.pvp']);
    LCA_glob2 = glob([output_dir, filesep, 'S', num2str(i_LCA), "Muggle", '_', '[0-9][0-9]', '_', '0', '.pvp']);
  else
    LCA_glob = glob([output_dir, filesep, 'S', num2str(i_LCA), "Muggle", '_', '[0-9]', '.pvp']);
    LCA_glob2 = glob([output_dir, filesep, 'S', num2str(i_LCA), "Muggle", '_', '[0-9][0-9]', '.pvp']);
  endif    
  if length(LCA_glob2) > 0
    LCA_glob = [LCA_glob; LCA_glob2]
  endif
  num_delay = length(LCA_glob);
  for i_delay = 1 : 1 %%num_delay
    [LCA_parent, LCA_file, LCA_ext, ~] = fileparts(LCA_glob{i_delay});
    if batchwidth > 1
      LCA_delay_str = regexp(LCA_file, ['S', num2str(i_LCA), "Muggle", '_', '(\d+)', '_', '0'], 'tokens');
    else
      LCA_delay_str = regexp(LCA_file, ['S', num2str(i_LCA), "Muggle", '_', '(\d+)'], 'tokens');
    endif
    LCA_delay_str = LCA_delay_str{1}{1};;
    for i_batchsweep = 1 : batchwidth
      if i_batchsweep > 1
	LCA_file_start  = regexp(LCA_file, '_\d+', 'start');
	LCA_file_tmp    = [LCA_file(1:LCA_file_start(end)), num2str(i_batchsweep-1)];
	output_dir_save = output_dir;
	output_dir = [parent_output_dir, filesep, 'batchsweep_', num2str(i_batchsweep-1,batchsweep_format_str)];
	[LCA_data_tmp, LCA_hdr_tmp] = readpvpfile([output_dir, filesep, LCA_file_tmp, LCA_ext]);
	output_dir = output_dir_save;
	LCA_data = [LCA_data; LCA_data_tmp];
      else
	[LCA_data, LCA_hdr] = readpvpfile(LCA_glob{i_delay});
      endif
    endfor %% i_batchsweep
    LCA_num_frames = length(LCA_data);
    LCA_nnz  = zeros(1,LCA_hdr.nf);
    LCA_vals = zeros(1,length(VThresh_bins{i_LCA}));
    for i_frame   = 1 : LCA_num_frames
      if isempty(LCA_data{i_frame}.values)
	continue
      endif
      LCA_ndx     = LCA_data{i_frame}.values(:,1);
      LCA_coef    = LCA_data{i_frame}.values(:,2);
      [LCA_feature, LCA_col, LCA_row] = ind2sub([LCA_hdr.nf, LCA_hdr.nx, LCA_hdr.ny], LCA_ndx+1);
      LCA_nnz    += hist(LCA_feature(:), [1:LCA_hdr.nf]);
      LCA_vals   += hist(LCA_coef(:), VThresh_bins{i_LCA}) ./ length(LCA_coef(:));
    endfor %% i_frame
   

    plot_LCA_nnz_flag = true
    if plot_LCA_nnz_flag && i_delay == 1
      LCA_nnz_normalized = LCA_nnz / (LCA_hdr.nx * LCA_hdr.ny * (LCA_num_frames));
      [LCA_nnz_sorted, LCA_rank_ndx] = sort(LCA_nnz_normalized, "descend");
      title_str = ['S', num2str(i_LCA), '_', LCA_delay_str, '_', 'nnz', '_', num2str(frameRecon_time)];
      fh_nnz = figure("name", title_str);
      subplot(2,1,1)
      LCA_nnz_hndl = bar(LCA_nnz_sorted);
      LCA_nnz_xtick = 0:ceil(LCA_hdr.nf/8):LCA_hdr.nf;
      set(gca, 'xtickmode', 'manual');
      set(gca, 'xtick', LCA_nnz_xtick);
      set(gca, 'xminortick', 'off');
      LCA_nnz_xticklabel = cell(1,length(LCA_nnz_xtick));
      for i_xtick = 1:length(LCA_nnz_xtick);
	LCA_nnz_xticklabel{i_xtick} = num2str(LCA_nnz_xtick(i_xtick));
      endfor
      set(gca, 'xticklabelmode', 'manual');
      set(gca, 'xticklabel', LCA_nnz_xticklabel);

      LCA_vals_normalized = LCA_vals / (LCA_num_frames);
      subplot(2,1,2)
      LCA_vals_hndl = bar(LCA_vals_normalized);
      LCA_vals_xticklabel = cell(1,length(VThresh_bins{i_LCA}));
      for i_val = 1 : length(VThresh_bins{i_LCA})
	LCA_vals_xticklabel{i_val} = "";
      endfor
      for i_val = 1 : 4 : length(VThresh_bins{i_LCA})
	LCA_vals_xticklabel{i_val} = num2str(VThresh_bins{i_LCA}(i_val)/VThresh(i_LCA),"%4.2f");
      endfor
      set(gca, 'xticklabel', LCA_vals_xticklabel);
      saveas(fh_nnz, [write_to, filesep, title_str, '.png'], 'png');

      disp(["nnz(", num2str(i_LCA), ") = ", num2str(mean(LCA_nnz_normalized))]);
      disp(["max(", num2str(i_LCA), ") = ", num2str(max(LCA_vals_normalized))]);
    endif %% plot_LCA_nnz_flag
    
%%%%%%%%%%%%% ORACLE %%%%%%%%%%%%%%%
    ATA_rank_flag = false; 
    checkpoint_glob = glob([parent_output_dir, filesep, 'Checkpoints', filesep, 'Checkpoint*']);
    for i_checkpoint = length(checkpoint_glob) %%: -2 : 1
      checkpoint_dir = checkpoint_glob{i_checkpoint};
      if i_LCA >= 1 
	ATA_glob = glob([checkpoint_dir, filesep, 'S', num2str(i_LCA), "Oracle", '_', LCA_delay_str, 'ToFrame_', '*', 'ReconError', "Oracle", '_W.pvp']);
      else
	%%break
	ATA_glob = glob([checkpoint_dir, filesep, 'S', num2str(i_LCA), "Oracle", '_', LCA_delay_str, 'ToFrame_', '*', '_ATA_W.pvp']);
      endif
      for i_ATA_delay = 1 : length(ATA_glob)
	[ATA_data, ATA_hdr] = readpvpfile(ATA_glob{i_ATA_delay});
	ATA_weights = ATA_data{1}.values{1};
	ATA_max_per_tableau = 1024;
	ATA_num_tableau = ceil(ATA_hdr.nf/ATA_max_per_tableau);
	ATA_num_per_tableau = min(ATA_max_per_tableau, LCA_hdr.nf);
	ATA_num_cols = ceil(sqrt(ATA_num_per_tableau));
	ATA_num_rows = ceil(ATA_num_per_tableau / ATA_num_cols);
	ATA_patch_size = [size(ATA_weights, 2), size(ATA_weights, 1)]; %%size(ATA_patch);
	[ATA_parent, ATA_file, ATA_ext, ~] = fileparts(ATA_glob{i_ATA_delay});
	ATA_delay_str = regexp(ATA_file, ['S', num2str(i_LCA), "Oracle", '_', LCA_delay_str, 'ToFrame', '_', '(\d+)'], 'tokens');
	ATA_delay_str = ATA_delay_str{1}{1};;
   %%%%%%%%%%%%%%%%%%%%%%% FRAME TO ORACLE %%%%%%%%%%%%%%% 
	for i_tableau = 1 : ATA_num_tableau
	  title_str = ['S', num2str(i_LCA), "Oracle", '_', LCA_delay_str, 'ToFrame_', ATA_delay_str, '_', 'ATA', '_', num2str(ATA_data{1}.time), '_', num2str(i_tableau)];
	  fh_ATA = figure("name", title_str);
	  ATA_array = zeros(ATA_patch_size(1)*ATA_num_rows, ATA_patch_size(2)*ATA_num_cols, 3);
	  for i_rank = (1 + (i_tableau-1) * ATA_num_per_tableau) : i_tableau * ATA_num_per_tableau
	    if ATA_rank_flag 
	      i_feature = LCA_rank_ndx(i_rank);
	    else
	      i_feature = i_rank;
	    endif
	    ATA_patch = squeeze(ATA_weights(:,:,:,i_feature));
	    %%ATA_patch = permute(ATA_patch, [2,1,3]);
	    ATA_uint8 = floor( 255 * ( (ATA_patch - min(ATA_patch(:))) / ( (max(ATA_patch(:)) - min(ATA_patch(:))) + ((max(ATA_patch(:)) == min(ATA_patch(:)))) ) ) );
	    [ATA_row, ATA_col] = ind2sub([ATA_num_rows, ATA_num_cols], i_rank-(i_tableau-1)*ATA_num_per_tableau);
	    ATA_array((ATA_row-1)*ATA_patch_size(1)+1:ATA_row*ATA_patch_size(1), ...
		      (ATA_col-1)*ATA_patch_size(2)+1:ATA_col*ATA_patch_size(2)) = ATA_uint8;
	  endfor %% i_rank
	  imagesc(uint8(permute(ATA_array,[2,1,3]))); box off; axis off; axis image; 
	  saveas(fh_ATA, [write_to, filesep, title_str, '.png'], 'png');
	endfor %% i_tableau
      endfor %% i_ATA_delay
    endfor %% i_checkpoint
  endfor  %% i_delay
endfor  %% i_LCA

%%%%%%%%% ENERGY %%%%%%%%%%%%%%
title_str = ['energy'];
fh_energy = figure("name", title_str);
cmap = colormap("prism");
for i_batch = 1:nbatch
  energy = dlmread([parent_output_dir, filesep, './EnergyProbe_batchElement_', num2str(i_batch-1), '.txt'])(2:end,3);
  plot(energy(100:100:end), "color", cmap(i_batch,:));
  hold on;
endfor
saveas(fh_energy, [write_to, filesep, title_str, '.png'], 'png');


