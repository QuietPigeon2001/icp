! Write a program that judges whether a given ISBN is valid or invalid. Also, a program can read in a valid ISBN with a single missing digit, marked with a question mark “?”, 
! and return the correct value for the missing digit.

program isbn
implicit none

integer, parameter:: n=10; character(n):: string
integer, dimension(n):: number; integer:: i,x=10,error_digit, error_multiple, amend, test1=0, test2=0, t, x2 = 10, a, e, x3, sum

write(*,*) "Type in a 10-digit ISBN marked with '?' for the missing digit"
read(*,*) string


!write(*,*) isbn_in

do i=1, n
    if (string(i:i) =='?') then
        error_digit = i
        error_multiple = x
    else if (string(i:i)=='X'.or.string(i:i)=='x') then
        number(i)=10
    else
        read(string(i:i),*) number(i)
    end if
    x = x - 1
end do

x = 10
sum=0

!when there is ?
do i=1, n
        if (string(i:i) == "?") then 
                do a=1, 10
                        sum = 0
                        x2 = 10
                        x3 = error_multiple - 1
                        test1 = 0
                        test2 = 0
                        !write(*,*) "a=", a
                        do t=1, error_digit-1
                                test1 = number(t)*x2 + test1
                                x2 = x2 - 1
                                !write(*,*) "test1=", test1
                        end do

                        do e=error_digit+1, 10
                                test2 = number(e)*x3 + test2    
                                x3 = x3-1
                                !write(*,*) x3
                        end do

                        sum = test1+test2+a*error_multiple

                        !write(*,*) test1, test2, sum, number(1)

                        if (mod(sum,11)==0) then
                                amend = a
                                exit
                        end if 
                end do
            if (amend == 10) then
                write(*,*) "The missing digit is X."
                stop
            end if 

            write(*,*) "The missing digit is", amend, "."
                            stop
            else 
                sum = sum + number(i)*x
                x = x - 1
        end if
end do

!write(*,*) sum
if (mod(sum,11)==0) then
        write(*,*) "The input ISBN is valid."
        stop
else
        write(*,*) "The input ISBN is invalid."
        stop
end if

end program isbn
