function pv_frames(name)
  % Savanna Smith, 5/30/17
  % create cell array of the data in correct format
  % in order to call writepvpsparsevaluesfile.m
  addpath("../OpenPV/mlab/util");        %where pvp function is located
  dTheta = pi/5;
  dPhi = pi/10;
  pixPerSide = 2048;
  theta0 = pi/2 - pi/20;                 %bias
  pathName = ['frames/' name '/'];
  d = dir([pathName 'frame' '*.txt']);
  numFrames = length(d(not([d.isdir])));
  %numFrames = 20;
  data = cell(numFrames,1);

  % LAMBDAS FOR COMPUTING INDEX
  xcoord = @(theta) (theta - theta0) / (dTheta/pixPerSide);
  ycoord = @(phi) phi/(dPhi/pixPerSide);
  linearIndex = @(row,col,nCols) (nCols * (row-1)) + col;

  % COMPUTE AND SAVE DATA PER FRAME
  for frame=1:numFrames
    fName = ['frames/' name '/frame' num2str(frame-1) '.txt'];
    m = dlmread(fName);                   %save data into matrix format
    nStars = size(m,1);
    data{frame}.time = frame;             %time and values struct vals needed
    data{frame}.values = ones(nStars, 2); %columns for index and value
    for i=1:nStars
      x = round(xcoord(m(i,1)));
      y = round(ycoord(m(i,2)));
      if(x < 1) x = 1; end%if
      index = linearIndex(x,y, pixPerSide);
      %index = sub2ind([pixPerSide, pixPerSide], x, y);
      %My own linear index is row by row concatination
      data{frame}.values(i,1) = index;
      data{frame}.values(i,2) = m(i,3);   %magnitude
      if x > pixPerSide || y > pixPerSide %bounds checking
        fprintf('Bounds error. x = %d y = %d index = %d\n',x,y,index);
      end%if
      if index < 0 || index > (pixPerSide * pixPerSide)
        fprintf('Bounds error. theta = %d phi = %d x = %d y = %d index = %d\n',m(i,1), m(i,2), x,y,index);
      end%if
      %fprintf('x = %d y = %d index = %d\n',x,y,index);
    end%for
  end%for

  % DETERMINE PARAMETERS AND EXECUTE
  % disp(data);
  nx = pixPerSide;
  ny = pixPerSide;
  nf = 1; %since black and white image
  pvpName = ['starFieldpvp/' name '.pvp'];
  matName = ['matfiles/' name '.mat'];
  save(matName,'data');
  writepvpsparsevaluesfile(pvpName, data, nx, ny, nf);
end%function
