"""

This program plots the inversion
recovery absolute magnitude after a
90 degree pulse.

"""

import numpy as np
import matplotlib.pyplot as plt

#constants
Mo = 1
TR = np.arange(0, 2000)
t = np.array([10, 50, 100, 200, 500, 1000, 2000])

#set up graph
plt.xlim(0,2001)
plt.title('Magnitude')
plt.xlabel('TR') #check labels
plt.ylabel('MZ')
plt.grid(True)


#function for each T1 value
M10 = Mo*(1-(2*np.exp(-TR/10)))  #T1 = 10
M100 =  Mo*(1-(2*np.exp(-TR/100)))  #T1 = 100
M1000 =  Mo*(1-(2*np.exp(-TR/1000)))  #T1 = 1000

#function for plotting individual TR points
M1 = Mo*(1-(2*np.exp(-t/10)))  #T1 = 10
M2 =  Mo*(1-(2*np.exp(-t/100)))  #T1 = 100
M3 =  Mo*(1-(2*np.exp(-t/1000)))  #T1 = 1000

#plot full function
plt.plot(TR, M10, label = 'T1 = 10')
plt.plot(TR, M100, label = 'T1 = 100')
plt.plot(TR, M1000 ,label = 'T1 = 1000')

#plot individual points on function
plt.scatter(t, M1)
plt.scatter(t, M2)
plt.scatter(t, M3)


#show graph
plt.legend()
plt.show()


