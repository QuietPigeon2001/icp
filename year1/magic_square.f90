! A sequence of integers where n^2
! is the largest sequence can be filled in an n  n square with many patterns but 
! there are particular patterns called “magic squares” for which the sums of all rows, columns and diagonals are 
! identical. It is possible to find many magic squares by investigating all combinations of distinct positive integers 
! in the sequence, i.e. 1, 2, …, n^2, whose patterns meet such requirement these days by computer. However, Simon 
! de la Loubère (1688) demonstrated that there is a simple method to find any size of magic squares of odd order
! of n. The method he brought to France after his mission in the Kingdom of Siam (the former name of Thailand) 
! was later known as the Siamese method.

program loubere
  implicit none
  integer, allocatable:: array(:,:), array2(:,:), array3(:,:)
  integer:: n, i, j, k, flag=1, r=1, c=1, br, bc, n2

  do while (flag>0)
    write(*,*) "Enter the size of a square matrix in an odd number:"
      read(*,*) n
    if(mod(n,2)/=0) then
      flag=0 
    else 
      write(*,*) "Odd numbers only; please try again"
    end if
  end do
  allocate(array(n,n))

  do i=1,n      ! initialize array to avoid errors
        do j=1,n
                array(i,j)=0
        end do
  end do
  
  array2 = array; array3 = array

  write(*,*)

  write(*,*) "1) Valid magic square in ascending order"

  c = (n+1)/2-1; r =2 

  do i=1,n**2  ! integers
  do
        c = c+1
        r = r-1
      call identifier(n,r,c)  
      !write(*,*) "previous int", array(r,c)
      if (array(c,r) == 0) then
        !write(*,*) r,c, i
        br = r
        bc = c
        exit
      else if (array(c,r)>0) then
          r = br+1
         ! write(*,*) "overflow"
          c = bc
        if (array(c,r) == 0) then
          !write(*,*) r,c, i
          exit
        end if 
      end if
     end do
   array(c,r) = i  ! main
   end do 

  do k=1,n
    write(*,*) (array(i,k), i=1, n)
  end do

  write(*,*) "Check the sums of a square magic"
  write(*,*) repeat("--",30)
  do i=1,n
    write(*,*) "Sum of row", i, "=", rowSum(array,n,i)
  end do

  do i=1,n
    write(*,*) "Sum of column", i, "=", colSum(array,n,i)
  end do

  write(*,*) "Sum of right diagonal = ", diagSum(array,n,1)
  write(*,*) "Sum of left diagonal = ", diagSum(array,n,n)

  write(*,*)
  
  write(*,*) "2) Invalid magic square with the misplaced first element"
  c = (n+1)/2-1; r = (n+1)/2+1  !init
  !write(*,*) n,c,r

  do i=1,n**2  ! integers
  do
        c = c+1
        r = r-1
      call identifier(n,r,c)  
      if (array2(c,r) == 0) then
        !write(*,*) r,c, i
        br = r
        bc = c
        exit
      else if (array2(c,r)>0) then
          r = br+1
          if (r>n) then
            r = 1
          end if 
         !write(*,*) "overflow", i
          c = bc
        if (array2(c,r) == 0) then
          !write(*,*) r,c, i
          exit
        end if 
      end if
     end do
   array2(c,r) = i  ! main
   end do 
 
  do k=1,n
    write(*,*) (array2(i,k), i=1, n)
  end do
  
  write(*,*) "Check the sums of a square magic"
  write(*,*) repeat("--",30)
  do i=1,n
    write(*,*) "Sum of row", i, "=", rowSum(array2,n,i)
  end do

  do i=1,n
    write(*,*) "Sum of column", i, "=", colSum(array2,n,i)
  end do

  write(*,*) "Sum of right diagonal = ", diagSum(array2,n,1)
  write(*,*) "Sum of left diagonal = ", diagSum(array2,n,n)

  write(*,*) 

  write(*,*) "3) Valid magic square in descending order"
  c = (n+1)/2-1; r = 2  !init
  !write(*,*) n,c,r

  i=n**2
  do j=1,n**2  ! integers
  do
        c = c+1
        r = r-1
      call identifier(n,r,c)  
      if (array3(c,r) == 0) then
        !write(*,*) r,c, i
        br = r
        bc = c
        exit
      else if (array3(c,r)>0) then
          r = br+1
          if (r>n) then
            r = 1
          end if 
         !write(*,*) "overflow", i
          c = bc
        if (array3(c,r) == 0) then
          !write(*,*) r,c, i
          exit
        end if 
      end if
     end do
   array3(c,r) = i  ! main
   i = i-1
   end do 
 
  do k=1,n
    write(*,*) (array3(i,k), i=1, n)
  end do
  
  write(*,*) "Check the sums of a square magic"
  write(*,*) repeat("--",30)
  do i=1,n
    write(*,*) "Sum of row", i, "=", rowSum(array3,n,i)
  end do

  do i=1,n
    write(*,*) "Sum of column", i, "=", colSum(array3,n,i)
  end do

  write(*,*) "Sum of right diagonal = ", diagSum(array3,n,1)
  write(*,*) "Sum of left diagonal = ", diagSum(array3,n,n)



  contains 
    subroutine identifier(n, r, c)  ! to check if the increments of r and c are out of bounds 
      integer, intent(in):: n
      integer, intent(inout):: r,c

        if (c > n) then 
          c = 1
        end if 
        if (r == 0) then
          r = n
        end if 
    end subroutine

    function rowSum(array, n, r)  ! to calculate the sum of row r
      integer:: array(n,n)
      integer:: rowSum, r, i, n
      rowSum=0
      do i=1, n
        rowSum = rowSum + array(i,r)
      end do
    end function

    function colSum(array, n, c)  ! to calculate the sum of column c
      integer:: array(n,n)
      integer:: colSum, c, i, n
      colSum=0
      do i=1, n
        colSum = colSum + array(c,i)
      end do
    end function

    function diagSum(array, n, c) ! to calculate the diagonals starting from column c
      integer:: array(n,n)
      integer:: diagSum, c, i, n, n2
      diagSum=0
      n2 = c
      if (c==1) then
        do i=1, n
          diagSum = diagSum + array(i,i)
        end do
      else if (c==n) then
        do i=1, n
          diagSum = diagSum + array(n2,i)
          n2 = n2 - 1
          end do 
      end if 
    end function

end program 
