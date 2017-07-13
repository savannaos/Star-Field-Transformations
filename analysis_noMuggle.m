close all
clear all
more off

addpath("../OpenPV/mlab/util")
graphics_toolkit("gnuplot")
setenv("GNUTERM","X11")

nbatch = 1;
batchwidth = 1;

parent_output_dir = '/nh/compneuro/scratch/starOut/starField_SPM_9X9X16_5_500/train17-5-17';
output_dir = parent_output_dir;
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

num_LCA_layers = 1;
nf = 16;
for i_LCA = 1 : num_LCA_layers    
%%%%%%%%%%%%% ORACLE %%%%%%%%%%%%%%%
    ATA_rank_flag = false;
    LCA_delay_str = "0";
    checkpoint_glob = glob([parent_output_dir, filesep, 'Checkpoints', filesep, 'Checkpoint*']);
    for i_checkpoint = length(checkpoint_glob) %%: -2 : 1
      checkpoint_dir = checkpoint_glob{i_checkpoint};
      if i_LCA < 1 
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
        ATA_num_per_tableau = min(ATA_max_per_tableau, nf);
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
saveto = [parent_output_dir, filesep, title_str, '.png'];
	  saveas(fh_ATA, saveto, 'png');
          %%cannot do colormap(gray) on axis since its an image, not a plot
	  imshow(rgb2gray(imread(saveto)))
	  saveas(gca,saveto,'png')

	endfor %% i_tableau
      endfor %% i_ATA_delay
    endfor %% i_checkpoint
endfor  %% i_LCA

%%%%%%%%% ENERGY %%%%%%%%%%%%%%
title_str = ['energy'];
fh_energy = figure("name", title_str);
cmap = colormap("prism");
for i_batch = 1:nbatch
  energy = dlmread([parent_output_dir, filesep, './EnergyProbe_batchElement_', num2str(i_batch-1), '.txt'])(2:end,3);
  plot(energy(500:500:end), "color", cmap(i_batch,:));
  hold on;
endfor
saveas(fh_energy, [parent_output_dir, filesep, title_str, '.png'], 'png');


