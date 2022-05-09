! Write a program to calculate numerical solutions of x, v, and a for a given spring mass 
! system and track xmax, vmax and amax which are the maximum absolute values of x, v and 
! a found in the time duration. 
program oscillation
implicit none
real(8):: A, t0, k0, m0, x0, v0, tf, w, phi, t, x, v, acc, xmax, vmax, accmax, dt
integer:: i, n

open (1, file = 'input.txt')
read(1,*) k0
read(1,*) m0
read(1,*) x0
read(1,*) v0
read(1,*) t0, tf

t = tf - t0
w = (k0/m0)**0.5
phi = atan(v0/(w*x0))
A = x0/cos(phi)

x = A*cos(w*t-phi)
v = -A*w*sin(w*t-phi)
acc  = -A*w**2*cos(w*t-phi) 

xmax = A
vmax = A*w
accmax = A*w**2

write(*,*) "1) Exact solution (t = tf)"
write(*,*) repeat("=", 90)
write(*,'(A6, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A8)') "t", "x", "v", "a", "|xmax|", "|vmax|", "|amax|"
write(*,*) repeat("-", 90)
write(*,'(F6.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F8.3)') t, x, v, acc, abs(xmax), abs(vmax), abs(accmax)
write(*,*) repeat("-", 90)
write(*,'(A6, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A8)') "(s)", "(m)", "(m/s)", "(m/s^2)", "(m)", "(m/s)", "(m/s^2)"
write(*,*) repeat("=", 90)

write(*,*) "2) Numerical solution (t = tf)"
write(*,*) "2.1) Forward-Euler's scheme"
write(*,*) repeat("=", 90)
write(*,'(A6, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A8)') "N", "x", "v", "a", "|xmax|", "|vmax|", "|amax|"
write(*,*) repeat("-", 90)

do n=1, 10000
    !reset
    dt = t/n
    x = x0
    v = v0
    acc = -w**2*x0
    xmax = 0
    vmax = 0
    accmax = 0

if (n==1 .or. n==10 .or. n==100 .or. n==1000 .or. n==10000) then
    do i=1, n
        x = x + v*dt
        v = v + acc*dt
        acc = -w**2*x
        if (abs(x) > abs(xmax)) then 
            xmax = x 
        end if 
        if (abs(v) > abs(vmax)) then 
            vmax = v 
        end if 
        if (abs(acc) > abs(accmax)) then 
            accmax = acc
        end if 
    end do
    write(*,'(I6, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F8.3)') n, x, v, acc, abs(xmax), abs(vmax), abs(accmax)
end if
end do
write(*,*) repeat("-", 90)
write(*,'(A6, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A8)') "(-)", "(m)", "(m/s)", "(m/s^2)", "(m)", "(m/s)", "(m/s^2)"

write(*,*) repeat("=", 90)
write(*,*) "2.2) Backward-Euler's scheme"
write(*,*) repeat("=", 90)
write(*,'(A6, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A8)') "N", "x", "v", "a", "|xmax|", "|vmax|", "|amax|"
write(*,*) repeat("-", 90)

do n=1, 10000
    !reset
    dt = t/n
    x = x0
    v = v0
    acc = -w**2*x0
    xmax = 0
    vmax = 0
    accmax = 0

if (n==1 .or. n==10 .or. n==100 .or. n==1000 .or. n==10000) then
    do i=1, n
        acc = -w**2*x
        v = v + acc*dt
        x = x + v*dt
        if (abs(x) > abs(xmax)) then 
            xmax = x 
        end if 
        if (abs(v) > abs(vmax)) then 
            vmax = v 
        end if 
        if (abs(acc) > abs(accmax)) then 
            accmax = acc
        end if 
    end do
    write(*,'(I6, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F10.3, 4X, F8.3)') n, x, v, acc, abs(xmax), abs(vmax), abs(accmax)
end if
end do
write(*,*) repeat("-", 90)
write(*,'(A6, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A10, 4X, A8)') "(-)", "(m)", "(m/s)", "(m/s^2)", "(m)", "(m/s)", "(m/s^2)"

end program oscillation
