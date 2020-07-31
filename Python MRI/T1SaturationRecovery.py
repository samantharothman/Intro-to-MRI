"""

This program plots the
x magnetization of saturation recovery.

"""

import numpy as np
import matplotlib.pyplot as plt


#get TR value
TR = int(input('TR: '))

#constants
T2 = 50
Mo = 1
t = np.arange(100)

#set up graph
plt.xlim(0,100)
plt.ylim(0,1.1)
plt.title('x Magnetization')
plt.xlabel('Time (msecs)') #check labels
plt.ylabel('Magenetization')
plt.grid(True)


#equations with each T1 value
M1 = Mo*(1-np.exp(-TR/10))*np.exp(-t/T2) #T1 = 10
M2 = Mo*(1-np.exp(-TR/100))*np.exp(-t/T2)  #T1 = 100
M3 = Mo*(1-np.exp(-TR/1000))*np.exp(-t/T2) #T1 = 1000
M4 = Mo*(1-np.exp(-TR/2000))*np.exp(-t/T2)  #T1 = 2000

#plot each equation
plt.plot(t, M1, label='T1=10')
plt.plot(t, M2, label ='T1=100')
plt.plot( t, M3, label ='T1=1000')
plt.plot(t, M4, label ='T1=2000')
plt.legend()
plt.show()
          
