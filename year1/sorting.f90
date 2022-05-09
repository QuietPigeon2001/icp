! Translate three simple sorting algorithms, which are 1) selection sort, 2) bubble sort and 3) insertion sort, into 
! a FORTRAN code to sort an unsorted list of integers. Code a single program which can successfully show the 
! processes of these three simple sorting algorithms for the unsorted list (/3, 6, 1, 2, 3/). The iterative procedures 
! of each algorithms must be clearly displayed in the output screen, ended by the ascending sequence

program sorting
        implicit none

        integer:: x1=3, x2=6, x3=1, x4=2, x5=3, i, j, dummy, k
        integer:: list(5)

        list(1)=3
        list(2)=6
        list(3)=1
        list(4)=2
        list(5)=3

        ! interface
        write(*,*) repeat("--",30)
        write(*,*) "Unsorted list | ", list(1), list(2), list(3), list(4), list(5)
        write(*,*) repeat("--",30)
        write(*,*)

        write(*,*) "**1. Selection sort**"
        write(*,*) repeat("--",30)

        do i=1, 5    
                do j=i+1, 5
                write(*,*) "compare", i, "&", j, "|", list(1), list(2), list(3), list(4), list(5)
                if (list(i) > list(j)) then
                        dummy = list(i)
                        list(i) = list(j)
                        list(j) = dummy
                end if 
                end do  
                write(*,*) repeat("--",30)
        end do 
        write(*,*) "Sorted list | ",  list(1), list(2), list(3), list(4), list(5)
        write(*,*)


        ! reset list
        list(1)=3
        list(2)=6
        list(3)=1
        list(4)=2
        list(5)=3

        write(*,*) "**2. Bubble sort**"
        write(*,*) repeat("--",30)

        j=5
        do while (j>0)
         
        do i=1, j-1       ! runs pass
        write(*,*) "compare", i, "&", i+1, "|", list(1), list(2), list(3), list(4), list(5)
        write(*,*) repeat("--",30)
        if (list(i) > list(i+1)) then
                dummy = list(i)
                list(i) = list(i+1)
                list(i+1) = dummy
        end if
        end do

                j = j-1
        end do
        write(*,*) "Sorted list | ",  list(1), list(2), list(3), list(4), list(5)
        write(*,*)


        ! reset list
        list(1)=3
        list(2)=6
        list(3)=1
        list(4)=2
        list(5)=3
        
        write(*,*) "**3. Insertion sort**"
        write(*,*) repeat("--",30)

        do j=2, 5
        i = j-1
        do while (i<j .and. i>0)        ! runs pass
        write(*,*) "compare", i, "&", i+1, "|", list(1), list(2), list(3), list(4), list(5)
        if (list(i) > list(i+1)) then
                dummy = list(i)
                list(i) = list(i+1)
                list(i+1) = dummy
        end if
        i = i-1
        end do
        write(*,*) repeat("--",30)
        end do

        write(*,*) "Sorted list | ",  list(1), list(2), list(3), list(4), list(5)
        write(*,*)

end program 
