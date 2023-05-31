# --- set material parameter --- #
h,p,cv = 2.0, 200.0, 300.0
h = h / 100.0 # [cm => m]
p = p * 1000.0 # [kN/m^2 => N/m^2]
cv = cv / 8.64e8 # [cm^2/day => m^2/s]
print("h is {}.".format(h))
print("p is {}.".format(p))
print("cv is {}.".format(cv))
