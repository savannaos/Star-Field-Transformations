m = dlmread('thetas.txt');
d = pi/2 + pi/10;
e = pi/2 - pi/10;
m = m(find(m<d));
m = m(find(m>e));
nBins = 20;
hist(m,nBins);
pause();
