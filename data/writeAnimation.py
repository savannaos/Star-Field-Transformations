import imageio
images = []
for i in range(20):
    fName = 'images/right/frame'+ str(i) + '.png'
    images.append(imageio.imread(fName))
kargs = {'duration': .3}
imageio.mimsave('starAnimation.gif', images, 'GIF', **kargs); #** = unpacks
