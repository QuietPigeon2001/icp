! Write a program that can approximate the centroid (xc, yc) of the given area A by using double precision numbers. 
! Your program needs to display four results using N = 5, 20, 100 and 10000.
program momentArea
implicit none
integer:: n, i
real(8):: x, x0=-1d0, xn=1d0, A, sumA, dx, xi, sumx, mx, xc, yc, my, sumy

n = 5
dx = (xn-x0)/n
!find area
!write(*,*) dx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumA = sumA + y(xi)
    end do
!write(*,*) sum
A = ((y(x0)+y(xn))/2+ sumA)*dx
!find Mx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumx = sumx + (y(xi)**2)/2
    end do
mx = (((y(x0)**2)/2+(y(xn)**2)/2)/2 + sumx)*dx
!find My
    !find summation
    do i = 1, n-1
        xi = x0 + i*dx
        sumy = sumy + y(xi)*xi
    end do
my = ((y(x0)*x0+ y(xn)*xn)/2 + sumy)*dx
xc = my/A
yc = mx/A
write(*,*) "Centroid when N = 5: ", "(", xc, yc, ")"

n = 20
dx = (xn-x0)/n
!find area
!write(*,*) dx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumA = sumA + y(xi)
    end do
!write(*,*) sum
A = ((y(x0)+y(xn))/2+ sumA)*dx
!find Mx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumx = sumx + (y(xi)**2)/2
    end do
mx = (((y(x0)**2)/2+(y(xn)**2)/2)/2 + sumx)*dx
!find My
    !find summation
    do i = 1, n-1
        xi = x0 + i*dx
        sumy = sumy + y(xi)*xi
    end do
my = ((y(x0)*x0+ y(xn)*xn)/2 + sumy)*dx
xc = my/A
yc = mx/A
write(*,*) "Centroid when N = 20: ", "(", xc, yc, ")"

n = 100
dx = (xn-x0)/n
!find area
!write(*,*) dx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumA = sumA + y(xi)
    end do
!write(*,*) sum
A = ((y(x0)+y(xn))/2+ sumA)*dx
!find Mx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumx = sumx + (y(xi)**2)/2
    end do
mx = (((y(x0)**2)/2+(y(xn)**2)/2)/2 + sumx)*dx
!find My
    !find summation
    do i = 1, n-1
        xi = x0 + i*dx
        sumy = sumy + y(xi)*xi
    end do
my = ((y(x0)*x0+ y(xn)*xn)/2 + sumy)*dx
xc = my/A
yc = mx/A
write(*,*) "Centroid when N = 100: ", "(", xc, yc, ")"

n = 1000
dx = (xn-x0)/n
!find area
!write(*,*) dx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumA = sumA + y(xi)
    end do
!write(*,*) sum
A = ((y(x0)+y(xn))/2+ sumA)*dx
!find Mx
    ! find summation
    do i=1, n-1
        xi = x0 + i*dx
        sumx = sumx + (y(xi)**2)/2
    end do
mx = (((y(x0)**2)/2+(y(xn)**2)/2)/2 + sumx)*dx
!find My
    !find summation
    do i = 1, n-1
        xi = x0 + i*dx
        sumy = sumy + y(xi)*xi
    end do
my = ((y(x0)*x0+ y(xn)*xn)/2 + sumy)*dx
xc = my/A
yc = mx/A
write(*,*) "Centroid when N = 1000: ", "(", xc, yc, ")"


contains
    function y(x)
    real(8):: y, x
        if (x<0) then
            y = (1-x**2)**0.5
            else 
                y = 1-x
        end if
    end function

end program
