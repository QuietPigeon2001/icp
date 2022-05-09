program prime
implicit none
integer:: min, max, factor, n, counter=0
logical:: prim
write(*,*) "Find prime number between two integers (minimum=2, maximum=32627)"
write(*,*) "Input the lower limit"
read(*,*) min
write(*,*) "Input the upper limit"
read(*,*) max
write(*,*) "The following numbers between", min, "and", max, "are prime:"
if (min >= 2 .and. max <= 32627) then 
do n = min, max
    prim = .true.
    do factor = 2, n-1
    if (mod(n,factor) == 0) then
    prim = .false.
        exit
    end if
    end do
    if (prim) then 
    write(*,'(I5,$)') n
    counter = counter + 1
    end if
end do
else 
write(*,*) "Invalid range. "
stop
end if
write(*,*) 
write(*,*) "A total number of", counter, "prime numbers are found in this range."
end program prime
