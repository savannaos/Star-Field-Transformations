function star_visuals(data)
  % Savanna Smith, 6/5/17
  % display images of data
  % octave uses 8 bits per pixel
  pixPerSide = 2000;
  rowFromLinear = @(index,nCols) ceil(index / nCols);
  colFromLinear = @(index, row, nCols) index - (nCols * (row-1)); %ind2sub
  numFrames = 20;
  old_dir= pwd();
  cd 'images/right/';

  for frame = 1 : numFrames
    nStars = size(data{frame,1}.values,1);
    im = zeros(pixPerSide,pixPerSide); %blank image
    % disp(~any(im(:)))
    for n = 1: nStars
      x = rowFromLinear(data{frame,1}.values(n,1), pixPerSide);
      y = colFromLinear(data{frame,1}.values(n,1), x, pixPerSide);
      im(x,y) = data{frame}.values(n,2);
    end%for
    fName = ['frame' num2str(frame-1) '.png'];
    imwrite(im,fName); %if this already exists, it will write on top of, delete previous data first
  end%for
  cd(old_dir);
end%function
