import numpy as np  
import matplotlib.pyplot as plt

# --- set material parameter --- #
h,p,cv = 2.0, 200.0, 300.0
h = h / 100.0 # [cm => m]
p = p * 1000.0 # [kN/m^2 => N/m^2]
cv = cv / 8.64e8 # [cm^2/day => m^2/s]

print("h is {}.".format(h))
print("p is {}.".format(p))
print("cv is {}.".format(cv))

# --- set numerical condition --- #
nz,nt = 21, 301
dt = 1.0
z,dz = np.linspace(0,h,nz,retstep=True)
w = cv*dt/dz**2
print("w =",w)

# --- execute finite difference scheme --- #
u = np.empty((nz,nt))

for i in range (0, nz):
    u[i, 0] = p
    
for n in range(1, nt):
    u[0, n], u[nz - 1, n] = 0, 0
    for i in range(1, nz - 1):
        u[i, n] = u[i, n - 1] + w * (u[i + 1, n - 1] - 2 * u[i, n - 1] + u[i - 1, n - 1])

# --- output result --- #
output_array = u[:,::60]
print(output_array)
np.savetxt("result.dat",output_array,fmt="%.4f")
