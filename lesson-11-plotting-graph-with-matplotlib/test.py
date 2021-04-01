import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

x = range(1,5)
y = [1,4,7,9]
z = [0.5,3,5,10]

plt.figure()

plt.plot(x,y, '--dg', linewidth=3)
plt.plot(x,z, 'dm')
plt.title('Test Plot')
plt.xlabel('X')
plt.ylabel('Y')
plt.legend(['Y', 'Z'])

plt.xlim(0,5)
plt.ylim(0, 12)
plt.show()