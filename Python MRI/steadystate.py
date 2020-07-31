"""

This program plots the magnetization
after steady state saturation.

"""


import numpy as np
import matplotlib.pyplot as plt

#constants
Mo = 1
T2 = 50
T = np.arange(0, 200)

#get TR value
TR = int(input('TR: '))

#function for each T1 value
M1 = Mo*(1-np.exp(-TR/100))*(np.exp(-T/T2))  #T1=100
M2 = Mo*(1-np.exp(-TR/1000))*(np.exp(-T/T2))  #T1=1000
M3 = Mo*(1-np.exp(-TR/2000))*(np.exp(-T/T2))  #T1=2000
M4 = Mo*(1-np.exp(-TR/10000))*(np.exp(-T/T2))  #T1=10000


#set up graph
plt.xlim(0,200)
plt.ylim(ymin=0)
plt.xlabel('Time (msecs)')
plt.ylabel('Magnetization')
plt.title('Steady State Saturation')
plt.grid(True)


#plot each equation 
plt.plot(T, M1, label = 'T1 = 100')
plt.plot(T, M2, label = 'T1 = 1000')
plt.plot(T, M3, label = 'T1 = 2000')
plt.plot(T, M4, label = 'T1 = 10000')

#show graph         
plt.legend()
plt.show()
