program bisection
implicit none
integer:: inpv
real(8):: npv, r, xu, xl, xm, tol=1d-5, unpv, lnpv, mnpv

write(*,*) repeat('==', 30)
write(*,'(2(A30))') 'Rates of interest (%)', "Net present values ($)"
write(*,*) repeat('==', 30)

! A table that shows the NPV rounded off to the nearest dollar with r = 0%, 10%, 15%, 20%, 25%, displayed in percentage with two decimal digits
r=0
npv=-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3
inpv=int(-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3)
write(*,'(F20.2, 10X, i20)') r*100, inpv

r=0.1
npv=-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3
inpv=int(-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3)
write(*,'(F20.2, 10X, i20)') r*100, inpv

r=0.15
npv=-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3
inpv=int(-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3)
write(*,'(F20.2, 10X, i20)') r*100, inpv

r=0.2
npv=-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3
inpv=int(-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3)
write(*,'(F20.2, 10X, i20)') r*100, inpv

r=0.25
npv=-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3
inpv=int(-300000+150000/(1+r)+150000/(1+r)**2+(150000+10000)/(1+r)**3)
write(*,'(F20.2, 10X, i20)') r*100, inpv

! Find the accurate value of IRR to five decimal places and print the results of 1) and 2) in the similar formats shown in the sample below to a screen. Sample of output is shown below where 窶忸窶� signifies your calculated numbers and faded numbers indicate the column.
write(*,*) repeat('==', 30)
xu = 0.2
xl = 0.3
xm = (xu + xl)/2
mnpv = -300000+150000/(1+xm)+150000/(1+xm)**2+(150000+10000)/(1+xm)**3
unpv = -300000+150000/(1+xu)+150000/(1+xu)**2+(150000+10000)/(1+xu)**3
lnpv = -300000+150000/(1+xl)+150000/(1+xl)**2+(150000+10000)/(1+xl)**3

do while (abs(mnpv) > tol) 
        if (mnpv > 0) then 
            xu = xm
            else
                xl = xm
        end if

            xm = (xu + xl)/2
            mnpv = -300000+150000/(1+xm)+150000/(1+xm)**2+(150000+10000)/(1+xm)**3
end do


write(*,'(A30, f20.5, A2)') "The internal rate of return is", xm*100, "%"
end program bisection
