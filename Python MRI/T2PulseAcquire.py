"""

This program plots the results
of a T2 pulse acquire on the real axis and imaginary axis,
along with the magnitude.

"""


import numpy as np
import matplotlib.pyplot as plt

#get frequency value and solve for omega
frequency = input('Frequency: ')
omega =  2 *  np.pi * int(frequency)

#get T2 value
T2 = int(input('T2: '))

Mo = 1

t = np.arange(100)

plt.figure(1)

#graph real axis
plt.subplot(311)
plt.title('Real Axis')
plt.xlabel('Time (msecs)')
plt.ylabel('Magenetization')
plt.xlim(0,100)
plt.ylim(-1,1)
plt.grid(True)
Mx =  Mo * np.exp(-t/T2) * np.cos(omega * t/1000 )
plt.plot(t, Mx)

#graph imaginary axis
plt.subplot(312)
plt.title('Imaginary axis')
plt.xlabel('Time (msecs)')
plt.ylabel('Magenetization')
plt.xlim(0,100)
plt.ylim(-1,1)
plt.grid(True)
My = Mo * np.exp(-t/T2) * (np.sin(omega * t/1000))
plt.plot(t, My)


#graph magnitude
plt.subplot(313)
plt.title('Magnitude')
plt.xlabel('Time')  
plt.ylabel('Magnitude')
plt.xlim(0,100)
plt.ylim(0,1)
plt.grid(True)
Mt = np.sqrt(np.square(Mx) + np.square(My))
plt.plot(t, Mt)



#show graphs
plt.tight_layout()
plt.show()



