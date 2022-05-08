! report 12
! |-4jan2022
! |-moreen_ho
! |-1023330822
program monteCarlo
implicit none
integer:: n, num_of_coord, i, j, r, rad, cen_x, cen_y
real(8), allocatable:: coord(:,:) 
real(8):: s, cx, cy, mx, my, sum_mx=0, sum_my=0, sum_area_whole=0, area_whole, x_c_1, y_c_1, x_c_2, y_c_2, area_2, lx, ly, m, lc
real(8):: x_c_3, y_c_3, area_3, x_c_4, y_c_4, area_4

s=4*4   ! constant rectangular area of the closed intervals



open(1, file= "random_coord.txt")

num_of_coord = countC("random_coord.txt")
!write(*,*) "check"
allocate(coord(num_of_coord,2))
!write(*,*) "check"

do i=1, num_of_coord-1
        read(1,*) coord(i,1), coord(i,2)
        coord(i,1) = adjusted(coord(i,1))
        coord(i,2) = adjusted(coord(i,2))
end do

! case 1
do i=1, num_of_coord-1
        if (c(coord(i,1), coord(i,2), 2, 0, 0) < 0) then
                sum_mx = coord(i,2)*1 + sum_mx
                sum_my = coord(i,1)*1 + sum_my
                sum_area_whole = 1 + sum_area_whole
        end if
end do

mx = (s/num_of_coord)*sum_mx
my = (s/num_of_coord)*sum_my
area_whole = (s/num_of_coord)*sum_area_whole
x_c_1 = my/area_whole
y_c_1 = mx/area_whole


! case 2
sum_mx = 0
sum_my = 0
sum_area_whole = 0
do i=1, num_of_coord-1
        if (c(coord(i,1), coord(i,2), 2, 0, 0) < 0 .and. c(coord(i,1), coord(i,2), 1, 0, 0) > 0) then
                sum_mx = coord(i,2)*1 + sum_mx
                sum_my = coord(i,1)*1 + sum_my
                sum_area_whole = 1 + sum_area_whole
        end if
end do

mx = (s/num_of_coord)*sum_mx
my = (s/num_of_coord)*sum_my
area_2 = (s/num_of_coord)*sum_area_whole
x_c_2 = my/area_2
y_c_2 = mx/area_2


! case 3 
sum_mx = 0
sum_my = 0
sum_area_whole = 0
do i=1, num_of_coord-1
        if (c(coord(i,1), coord(i,2), 2, 0, 0) < 0 .and. c(coord(i,1), coord(i,2),1,0,0) > 0 &
        .and. l(coord(i,1), coord(i,2)) < 0) then 
                sum_mx = coord(i,2)*1 + sum_mx
                sum_my = coord(i,1)*1 + sum_my
                sum_area_whole = 1 + sum_area_whole
        end if
end do

mx = (s/num_of_coord)*sum_mx
my = (s/num_of_coord)*sum_my
area_3 = (s/num_of_coord)*sum_area_whole
x_c_3 = my/area_3
y_c_3 = mx/area_3


! case 4
sum_mx = 0
sum_my = 0
sum_area_whole = 0
do i=1, num_of_coord-1
        if (c(coord(i,1), coord(i,2), 2, 0, 0) < 0 .and. c(coord(i,1), coord(i,2),1,0,-1) > 0 &
        .and. l(coord(i,1), coord(i,2)) < 0) then 
                sum_mx = coord(i,2)*1 + sum_mx
                sum_my = coord(i,1)*1 + sum_my
                sum_area_whole = 1 + sum_area_whole
        end if
end do

mx = (s/num_of_coord)*sum_mx
my = (s/num_of_coord)*sum_my
area_4 = (s/num_of_coord)*sum_area_whole
x_c_4 = my/area_4
y_c_4 = mx/area_4



write(*,'(4(a5, 5x))') "Cases", "A", "x_c", "y_c"
write(*,*) repeat("-", 60)
write(*,'(a5, 5x, 3(f6.3,5x))') "I", area_whole, x_c_1, y_c_1
write(*,'(a5, 5x, 3(f6.3,5x))') "II", area_2, x_c_2, y_c_2
write(*,'(a5, 5x, 3(f6.3,5x))') "III", area_3, x_c_3, y_c_3
write(*,'(a5, 5x, 3(f6.3,5x))') "IV", area_4, x_c_4, y_c_4


contains
        function countC(filename)       ! counts the number of coordinates
                character(len=*):: filename
                integer:: n, io, num_of_coord, countC
                open(2, file=filename)
                        n = 0
                do 
                        read(2,*,iostat=io)
                        n = n + 1
                        if (io/=0) then
                                exit
                        end if
                end do
                countC = n
        end function countC

        function adjusted(coordinate)
                real(8):: adjusted, coordinate, r=2.0
                adjusted = 2*r*coordinate-r
        end function

        function c(cx,cy,rad,cen_x,cen_y)
                integer:: rad, cen_x, cen_y
                real(8):: c, cx, cy
                c = (cx-cen_x)**2+(cy-cen_y)**2-rad**2
        end function

        function l(lx,ly)
                real(8):: l, lx, ly, m, lc
                m = (2d0-0d0)/(0d0-2d0)
                lc = 2d0 - m*0d0
                l = ly - (m*lx+lc)
        end function

end program
