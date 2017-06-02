% Savanna Smith, 5/30/17 updated: 6/1/17
% create cell array of the data in correct format
% in order to call writepvpsparsevaluesfile.m
addpath("../OpenPV/mlab/util"); % where pvp function is located
numFrames = 20;
dTheta = pi/2 + pi/20;
dPhi = pi/10;
pixPerSide = 2000;
data = cell(numFrames,1);

% LAMBDAS FOR COMPUTING INDEX
xcoord = @(x) x/(dTheta/pixPerSide);
ycoord = @(y) y/(dPhi/pixPerSide);
linearIndex = @(row,col,nCols) (nCols * (row-1)) + col;

% COMPUTE AND SAVE DATA PER FRAME
for frame = 1:numFrames
  fName = ['frames/frame' num2str(frame-1) '.txt'];
  m = dlmread(fName); % save data into matrix format
  nStars = size(m,1);
  data{frame}.time = frame; % struct vals
  data{frame}.values = ones(nStars, 2); %columns for index and value
  for i=1:nStars
    index = linearIndex(xcoord(m(i,1)), ycoord(m(i,2)), pixPerSide);
    data{frame}.values(i,1) = round(index);
    data{frame}.values(i,2) = m(i,3); %magnitude
  end%for
end%for

% DETERMINE PARAMETERS AND EXECUTE
% disp(data);
nx = 2000;
ny = 2000;
nb = 20;
writepvpsparsevaluesfile('header.pvp', data, nx, ny, nb);
