addpath('../OpenPV/mlab/util');
star_file = 'starField_right2000.pvp'
[star_data, star_hdr] = readpvpfile(star_file);
star_frames = star_hdr.nbands;
star_nx = star_hdr.nx;
star_ny = star_hdr.ny;
for i_frame = 1:star_frames
  fh = figure('name', num2str(i_frame));
  star_ndx = round(star_data{i_frame}.values(:,1));
  [star_col, star_row] = ind2sub([star_ny, star_nx], star_ndx);
  plot(star_col, star_row, '.');
  saveas(gcf, ['star_field_', num2str(i_frame, "%03i"), '.png']);
end%for
