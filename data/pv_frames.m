% Savanna Smith, 5/30/17 updated: 6/2/17
% create cell array of the data in correct format
% in order to call writepvpsparsevaluesfile.m
addpath("../OpenPV/mlab/util");        %where pvp function is located
numFrames = 20;
dTheta = pi/5;
dPhi = pi/10;
pixPerSide = 2000;
theta0 = pi/2 - pi/20;
data = cell(numFrames,1);

% LAMBDAS FOR COMPUTING INDEX
xcoord = @(theta) (theta - theta0) / (dTheta/pixPerSide);
ycoord = @(phi) phi/(dPhi/pixPerSide);
linearIndex = @(row,col,nCols) (nCols * (row-1)) + col;

% COMPUTE AND SAVE DATA PER FRAME
for frame = 1:numFrames
  fName = ['frames/frame' num2str(frame-1) '.txt'];
  m = dlmread(fName);                   %save data into matrix format
  nStars = size(m,1);
  data{frame}.time = frame;             %time and values struct vals needed
  data{frame}.values = ones(nStars, 2); %columns for index and value
  for i=1:nStars
    x = xcoord(m(i,1));
    y = ycoord(m(i,2));
    index = linearIndex(x,y, pixPerSide);
    data{frame}.values(i,1) = round(index);
    data{frame}.values(i,2) = m(i,3);   %magnitude
    if x > pixPerSide || y > pixPerSide %bounds checking
      fprintf('Bounds error. x = %d y = %d index = %d\n',x,y,index);
    end%if
    %fprintf('x = %d y = %d index = %d\n',x,y,index);
  end%for
end%for

% DETERMINE PARAMETERS AND EXECUTE
% disp(data);
nx = 2000;
ny = 2000;
nf = 1;
writepvpsparsevaluesfile('header.pvp', data, nx, ny, nf);
