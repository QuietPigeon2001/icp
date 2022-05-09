! Develop a program for solving the linear system using the Gauss-Jordan elimination method 
! and the partial pivoting technique. The input data is read from the text files and the program 
! must be able to detect the size of the matrix for dynamic memory allocation. If the matrix is 
! singular, the error message “The matrix is singular!” should be appeared before terminating 
! the program. Herein, 6 files for testing (set1.txt ~ set6.dat) are provided. One of 
! them contains a singular matrix. For non-singular matrix, its solutions should be displayed on 
! the screen.
! |-- Moreen Ho
! |-- 1023330822
! |-- 16 jan 2022
program gauss
        implicit none
        real(8), dimension(:,:), allocatable:: origin, matrix, sMatrix
        real(8), dimension(:), allocatable:: temp
        integer:: i, j, jmax, k, n, array_shape(2), r, c, flag
        real(8):: pivot, ratio, tor = 0d8

        call read_data(origin)
        write(*,'(A)') "The original matrix"
        Array_shape = shape(origin)
        n=array_shape(1)
        call write_data(origin, n)
        allocate(temp(n+1), matrix(n,n+1), sMatrix(n,n+1))
        matrix = origin

        ! search for pivot by comparing the first value of each row
        do r=1, n
                pivot = matrix(r,r)
                jmax = r
                do j=r, n
                if (abs(pivot - matrix(j,r)) > tor) then
                if (abs(pivot) <= abs(matrix(j,r)) .and. matrix(r,r) /= matrix(j,r)) then 
                        
                        pivot = matrix(j,r)
                        jmax = j
                        write(*,*) j, abs(matrix(r,r)), abs(matrix(j,r)), jmax
                end if
                end if
                end do

        write(*,'(a10, 5x, f10.3)') "pivot: ", pivot         ! pivot found

        if (pivot == 0) then
        exit 
        end if
       ! write(*,*) jmax, r

        if (jmax > r) then 
                write(*,*) "Swap row no.", r, "with row no. ",jmax
                call swap_data(matrix, n, r, jmax, sMatrix)        ! swaps row
                matrix = sMatrix
                else
                write(*,*) "Swap of the pivot is unnecessary"
        end if
        
        call write_data(matrix, n)     ! writes new row

        if (matrix(r,r) /= 1 .and. matrix(r,r) /= 0)then
                write(*,*) "Divide row no.", r, "by the pivot element"
                call divide_data(matrix, n, r, sMatrix)        ! divides by pivot element
                matrix = sMatrix
                call write_data(matrix, n)     ! writes new row
        end if
        
        


        do i=1, n
        if (matrix(i,r) /= 0) then        ! eliminate other rows except row... if can form the second pivot
                write(*,*) "Eliminate other rows except row no. ", r 
                call eliminate_data(matrix, n, r, sMatrix)
                matrix = sMatrix
                exit
        end if 
        end do

        call write_data(matrix, n)     ! writes new row

        end do

        do j=1, n       ! check if the matrix is singular
                flag = 0
                do i=1, n
                        if (matrix(j,i) /= 0) then
                        flag = flag + 1
                        end if 
                end do


                if (flag > 1) then
                        write(*,*) "The matrix is singular!"
                        stop
                        else if (flag == 0 .and. matrix(j, n+1) /= 0) then
                        write(*,*) "The matrix is singular!"
                        stop
                end if
        end do 



        do i=1, n 
                write(*,'(a1, i1, 1x, a1, 5x, f10.3)') "x",i, "=", matrix(i,n+1) 
        end do





        contains
                subroutine read_data(Array)
                        real(8), dimension(:,:), allocatable, intent(out):: Array
                        integer:: status=0, i, n=0
                        character(50):: filename
                        real(8):: r
                        write(*,*) "Enter the file name of the matrix"
                        read(*,*) filename
                        open(1, file=filename)
                        do while (status==0)
                                read(1, *, iostat=status) r
                                n = n+1
                        end do
                        n=n-1
                        allocate(Array(n, n+1))
                        rewind(1)
                        read(1,*) (Array(i,:), i=1, n)
                        close(1)
                 end subroutine read_data

                 subroutine write_data(Array, n)
                         real(8), dimension(:,:), allocatable, intent(in):: Array
                         integer, intent(in):: n
                         integer:: k, l
                         do k=1, n
                                write(*,'(A1,$)') "|"
                                        do l=1, n
                                                write(*,'(f12.3,$)') Array(k,l)
                                        end do 
                                write(*,'(A1, $)') '|'
                                write(*,'(F12.3, $)') Array(k,l)
                                write(*,'(A1)') '|'
                         end do
                 end subroutine write_data

                subroutine swap_data(Array, n, r, j, Array2)       ! original array, n, jmax, new array
                        real(8), dimension(:,:), allocatable, intent(in):: Array
                        real(8), dimension(:,:), allocatable, intent(out):: Array2
                        real(8), dimension(:), allocatable:: temp
                        integer, intent(in):: n, j, r
                        integer:: i, k
                        allocate(Array2(n,n+1), temp(n+1))
                        do i=1,n+1
                                temp(i) = Array(r,i)
                                Array2(r,i) = Array(j,i)
                                Array2(j,i) = temp(i)
                                do k = 1, n
                                        if (k /= r .and. k /= j) then
                                                Array2(k,i) = Array(k,i)
                                        end if
                                end do
                        end do  
                end subroutine swap_data

                subroutine divide_data(Array, n, r, Array2)
                        real(8), dimension(:,:), allocatable, intent(in):: Array
                        real(8), dimension(:,:), allocatable, intent(out):: Array2
                        integer, intent(in):: n, r
                        integer:: i, k, l                       
                        allocate(Array2(n, n+1))
                        

                        do k=1, n 
                                do i=1, n+1  
                                if (k==r) then 
                                Array2(k,i) = Array(k,i)/Array(r,r)        
                                else 
                                Array2(k,i) = Array(k,i)
                                end if
                                end do
                        end do  


                end subroutine divide_data

                subroutine eliminate_data(Array, n, r, Array2)     ! matrix, n, which row to be eliminated, new array
                        real(8), dimension(:,:), allocatable, intent(in):: Array
                        real(8), dimension(:,:), allocatable, intent(out):: Array2
                        integer, intent(in):: n, r
                        integer:: i, k, l, j  
                        real(8):: ratio                    
                        allocate(Array2(n, n+1))
                        do j=1, n 

                        do i=1, n+1 
                                Array2(j,i) = Array(j,i)
                        if (j /= r) then
                                if (Array(r,r) /= 0) then
                                        ratio = Array(j,r)/Array(r,r) 
                                        Array2(j,i) = Array(j,i) - ratio*Array(r,i)
                                !write(*,*) i

                                end if
                        end if 

                                
                        end do
                        end do

                end subroutine eliminate_data

end program
