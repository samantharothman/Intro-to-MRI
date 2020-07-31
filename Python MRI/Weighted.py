"""

This program plots the magnitudes and
contrast by weighting T1 and T2 values.

"""


import numpy as np
import matplotlib.pyplot as plt

TR = np.arange(0,5000)

Mo = 1

# get T1 values
csfT1 = int(input('T1 for CSF: '))
grayT1 = int(input('T1 for gray matter: ' ))
whiteT1 = int(input('T1 for white matter: '))
fatT1 = int(input('T1 for fat: '))

# get T2 values
csfT2 = int(input('T2 for CSF: '))
grayT2 = int(input('T2 for gray matter: ' ))
whiteT2 = int(input('T2 for white matter: '))
fatT2 = int(input('T2 for fat: '))

# get TE value
TE = int(input('TE: ' ))

# equations for signal magnitude
csf = Mo*(1-np.exp(-TR/csfT1))*(np.exp(-TE/csfT2))
gray = Mo*(1-np.exp(-TR/grayT1))*(np.exp(-TE/grayT2))
white = Mo*(1-np.exp(-TR/whiteT1))*(np.exp(-TE/whiteT2))
fat = Mo*(1-np.exp(-TR/fatT1))*(np.exp(-TE/fatT2))

# plot magnitudes
plt.subplot(221)
plt.plot(TR, csf, label = 'CSF')
plt.plot(TR, gray, label = 'Gray matter')
plt.plot(TR, white, label = 'White matter')
plt.plot(TR, fat, label = 'Fat')
plt.title('Weighted Imaging')
plt.xlabel('TR (msecs)')
plt.ylabel('Magnitude')
plt.grid(True)
plt.legend()
plt.xlim(0, 5000)
plt.ylim(ymin = 0)

# plot contrast between gray matter and CSF
plt.subplot(222)
csfcontrast = gray - csf
plt.plot(TR, csfcontrast)
if np.all(csfcontrast)<=0:
    plt.plot(np.argmin(csfcontrast), np.min(csfcontrast), marker = 'o')
else:
    plt.plot(np.argmax(csfcontrast), np.max(csfcontrast), marker = 'o') 
plt.xlim(0, 5000)
plt.grid(True)
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.title('Contrast Between Gray Matter and CSF')

# plot contrast between gray matter and white matter
plt.subplot(223)
whitecontrast = gray - white
plt.plot(TR, whitecontrast)
if np.all(whitecontrast <= 0):
    plt.plot(np.argmin(whitecontrast), np.min(whitecontrast), marker = 'o')
else:
    plt.plot(np.argmax(whitecontrast), np.max(whitecontrast), marker = 'o')
plt.xlim(0, 5000)
plt.grid(True)
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.title('Contrast Between Gray and White Matter')

#plot contrast between gray matter and fat
plt.subplot(224)
fatcontrast = gray - fat
plt.plot(TR, fatcontrast)
if np.all(fatcontrast<=0):
    plt.plot(np.argmin(fatcontrast), np.min(fatcontrast), marker = 'o')
else:
    plt.plot(np.argmax(fatcontrast), np.max(fatcontrast), marker = 'o') 
plt.xlim(0, 5000)
plt.grid(True)
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.title('Contrast Between Gray Matter and Fat')


#show graphs
plt.tight_layout()
plt.show()



