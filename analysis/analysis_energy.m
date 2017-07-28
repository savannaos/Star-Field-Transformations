close all
clear all
more off

addpath("../../OpenPV/mlab/util")
graphics_toolkit("gnuplot")
setenv("GNUTERM","X11")

nbatch = 8;
batchwidth = 1;
steps = 100; 

out_folder = '~/Star-Field-Transformations/starOut/7-28-17';
mkdir(out_folder);
parent_output_dir = '/nh/compneuro/scratch/starOut/starField_SPM_9X9X16_5_500/train17-24-17';
output_dir = parent_output_dir;

title_str = ['energy'];
fh_energy = figure("name", title_str);
cmap = colormap("prism");
for i_batch = 1:nbatch
  energy = dlmread([parent_output_dir, filesep, './EnergyProbe_batchElement_', num2str(i_batch-1), '.txt'])(2:end,3);
  plot(energy(1:steps:end), "color", cmap(i_batch,:));
  hold on;
  %saveas(fh_energy, [out_folder, filesep, title_str, '_', num2str(i_batch), '.png'], 'png');
endfor
saveas(fh_energy, [out_folder, filesep, title_str, '.png'], 'png');


