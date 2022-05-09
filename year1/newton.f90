program character
implicit none
real(8):: err = 1D-12, tol = 1D-6, x1, x2, r1, r2, dr
integer:: i

write(*,*) "Input guess value: "
read(*,*) x1

i = 0
x2 = x1 + err
r1 = x1**2 - 2**x1
r2 = x2**2 - 2**x2
dr = (r2-r1)/err

write(*,*) repeat('-', 30)
write(*,*) "Iteration i ", " ", "Variable x ", "                ", "Residual r(x)"
write(*,*) i, x1, r1


do while (abs(r1)>tol.and.i<50)
    x1 = x1 - r1/dr
    x2 = x1 + err
    r1 = x1**2 - 2**x1
    r2 = x2**2 - 2**x2
    dr = (r2-r1)/err

    i = i + 1

    write(*,*) i, x1, r1
end do

if (i >= 50) then
    write(*,*) "Divergence value has been reached."
end if

write(*,*) repeat('-', 30)
write(*,*) "The numerical solution is", x1

end program character
