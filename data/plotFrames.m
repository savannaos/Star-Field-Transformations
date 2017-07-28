name = 'move_by_alpha7-28/';
star_frames = 448;
for i_frame = 1:star_frames
  star_file = ['frames/' name '/frame' num2str(i_frame-1) '.txt'];
  m = dlmread(star_file);
  star_col = m(:,2);
  star_row = m(:,1);
  fh = figure('name', num2str(i_frame));
  plot(star_col, star_row, '.');
  axis ( [ 0 .32 1.2 1.9]);
  saveas(gcf, ['plots/' name 'orig/frame_' num2str(i_frame, "%03i") '.png']);
end%for
