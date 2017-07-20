function star_visuals(data)
  % Savanna Smith, 6/5/17
  % display images of data
  % data should be a cell array of size number of frames,
  % with values item that contains the linear indices of the stars in that frame
  % and the magnitude of that star_nx
  % octave uses 16 bits per pixel
  pixPerSide = 256;
  imagePix = pixPerSide;
  %rowFromLinear = @(index,nCols) ceil(index / nCols);
  %colFromLinear = @(index, row, nCols) index - (nCols * (row-1)); %ind2sub
  numFrames = size(data,1);
  %numFrames = 10;
  old_dir= pwd();
  cd 'images/';
  oor = 0;
  for frame = 1 : numFrames
    nStars = size(data{frame,1}.values,1);
    im = zeros(imagePix,imagePix); %blank image
    % disp(~any(im(:)))
    for n = 1: nStars
      %x = rowFromLinear(data{frame,1}.values(n,1), pixPerSide);
      %y = colFromLinear(data{frame,1}.values(n,1), x, pixPerSide);
      v = data{frame,1}.values(n,1);
      [y, x] = ind2sub([pixPerSide,pixPerSide], v);
    % fprintf("x:%d, y:%d\n", x,y);
      if x <= imagePix && y <= imagePix
        im(x,y)   = data{frame}.values(n,2);
        im(x+1,y) = data{frame}.values(n,2);
        im(x,y+1) = data{frame}.values(n,2);
        if(x>1)
          im(x-1,y) = data{frame}.values(n,2);
        end%if
        if(y>1)
          im(x, y-1) = data{frame}.values(n,2);
        end%if
      else  oor =oor + 1;
      end%if
    end%for

    fName = ['frame' num2str(frame-1) '.png'];
    imwrite(im,fName); %if this already exists, it will write on top of, delete previous data first
  end%for
  fprintf('%d stars out of range',oor);
  cd(old_dir);
end%function
