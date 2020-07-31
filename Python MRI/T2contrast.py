"""

This program plots the signal magnitudes and
contrast relative to gray matter using
T2 values.

"""

import numpy as np
import matplotlib.pyplot as plt

Mo = 1
TE = np.arange(0,200)

# get T2 values
csfT2 = int(input('T2 for CSF: '))
grayT2 = int(input('T2 for gray matter: ' ))
whiteT2 = int(input('T2 for white matter: '))
fatT2 = int(input('T2 for fat: '))

plt.figure()

# equations for signal magnitude using given T2 values
CSF = Mo * np.exp(-TE/csfT2)
gray = Mo * np.exp(-TE/grayT2)
white = Mo * np.exp(-TE/whiteT2)
fat = Mo * np.exp(-TE/fatT2)

# plot magnitudes
plt.subplot(221)
plt.plot(TE, CSF, label = 'CSF')
plt.plot(TE, gray, label = 'Gray Matter')
plt.plot(TE, white, label = 'White Matter')
plt.plot(TE, fat, label = 'Fat')
plt.legend()
plt.title('T2 Contrast')
plt.xlabel('TR (msecs)')
plt.ylabel('Magnitude')
plt.xlim(0,200)
plt.ylim(ymin=0)
plt.grid(True)

# plot contrast between gray matter and CSF
plt.subplot(222)
csfcontrast = gray - CSF
plt.plot(TE, csfcontrast)
if np.all(csfcontrast)<=0:
    plt.plot(np.argmin(csfcontrast), np.min(csfcontrast), marker = 'o')
else:
    plt.plot(np.argmax(csfcontrast), np.max(csfcontrast), marker = 'o')    
plt.xlim(0,200)
plt.grid(True)
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.title('Contrast Between Gray Matter and CSF')

# plot contrast between gray matter and white matter
plt.subplot(223)
whitecontrast = gray - white
plt.plot(TE, whitecontrast)
if np.all(whitecontrast <= 0):
    plt.plot(np.argmin(whitecontrast), np.min(whitecontrast), marker = 'o')
else:
    plt.plot(np.argmax(whitecontrast), np.max(whitecontrast), marker = 'o') 
plt.title('Contrast Between Gray and White Matter')
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.xlim(0,200)
plt.grid(True)

#plot contrast between gray matter and fat
plt.subplot(224)
fatcontrast = gray - fat
plt.plot(TE, fatcontrast)
if np.all(fatcontrast<=0):
    plt.plot(np.argmin(fatcontrast), np.min(fatcontrast), marker = 'o')
else:
    plt.plot(np.argmax(fatcontrast), np.max(fatcontrast), marker = 'o') 
plt.xlim(0,200)
plt.grid(True)
plt.xlabel('TR (msecs)')
plt.ylabel('Contrast')
plt.title('Contrast Between Gray Matter and Fat')

#show graphs
plt.tight_layout()
plt.show()



