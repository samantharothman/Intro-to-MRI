"""

This program plots the magnitudes after saturation
recovery and the resulting contrast
relative to gray matter.

"""


import numpy as np
import matplotlib.pyplot as plt

Mo = 1
TR = np.arange(0,5000)

# get T1 values
csfT1 = int(input('T1 for CSF: '))
grayT1 = int(input('T1 for gray matter: ' ))
whiteT1 = int(input('T1 for white matter: '))
fatT1 = int(input('T1 for fat: '))

plt.figure()

# equations for signal magnitude using given T1 values
CSF = Mo * np.exp(-TR/csfT1)
gray = Mo * np.exp(-TR/grayT1)
white = Mo * np.exp(-TR/whiteT1)
fat = Mo * np.exp(-TR/fatT1)


# plot magnitudes
plt.subplot(221)
plt.plot(TR, CSF, label = 'CSF')
plt.plot(TR, gray, label = 'Gray Matter')
plt.plot(TR, white, label = 'White Matter')
plt.plot(TR, fat, label = 'Fat')
plt.legend()
plt.title('T1 Contrast')
plt.xlabel('TR (msecs)')
plt.ylabel('Magnitude')
plt.grid(True)
plt.xlim(0, 5000)
plt.ylim(ymin=0)

# plot contrast between gray matter and CSF
plt.subplot(222)
csfcontrast = gray - CSF
plt.plot(TR, csfcontrast)
if np.all(csfcontrast) <= 0:
    plt.plot(np.argmin(csfcontrast), np.min(csfcontrast), marker = 'o')
else:
    plt.plot(np.argmax(csfcontrast), np.max(csfcontrast), marker = 'o') 
plt.xlim(0, 5000)
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.grid(True)
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
