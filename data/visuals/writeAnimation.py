import imageio
images = []
for i in range(150):
    fName = 'images/frame'+ str(i) + '.png'
    images.append(imageio.imread(fName))
kargs = {'duration': .1}
imageio.mimsave('starAnimation.gif', images, 'GIF', **kargs); #** = unpacks
