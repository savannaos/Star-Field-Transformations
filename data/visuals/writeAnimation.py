import imageio
images = []
for i in range(40):
    fName = 'images/frame'+ str(i) + '.png'
    images.append(imageio.imread(fName))
kargs = {'duration': .3}
imageio.mimsave('starAnimation.gif', images, 'GIF', **kargs); #** = unpacks
