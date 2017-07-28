import imageio
images = []
folder = '7-18-17/'
beg = 'S1Oracle_0ToFrame_'
framestr = 'Frame_0_9500_'
for i in range(8):
    fName = folder + framestr + str(i) + '.png'
    images.append(imageio.imread(fName))
kargs = {'duration':1}
outFile = folder + framestr + '.gif'
imageio.mimsave(outFile , images, 'GIF', **kargs)
