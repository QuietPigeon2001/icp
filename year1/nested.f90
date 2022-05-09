program summation
implicit none

integer:: p
real(8):: sum, x

write(*,*) ("Input a finite number of radicals: ")
read(*,*) p
x = (1+p)**0.5

if (p <= 2) then 
    x = (1+(p-1)*p)**0.5
end if

do while (p > 2)
    sum = (1+(p-1)*x)**0.5
    x = sum
    p = p - 1
end do

write(*,*) x

end program summation
