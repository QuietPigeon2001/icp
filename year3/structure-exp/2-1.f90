program frame_analysis
    implicit none
    integer nnode , nelem
    integer , allocatable :: ine (: ,:) , ibc (: ,:) , mapping (: ,:)
    real (8) , allocatable :: pos (: ,:) , force (: ,:) , disp (: ,:)
    real (8) , allocatable :: hght (:) , wdth (:) , ym (:) , EA (:) , EI (:)
    real (8) , allocatable :: s (: ,:) ,u (:)
    real (8) se (6 ,6)
    integer ielem , inode ,i , j

    !!!=== INPUT DATA ===
    open (100 , file = "kunoji.dat")
    read (100 ,*) nnode , nelem
    write(*,*) nnode, nelem
    allocate ( pos (2 , nnode ) , force (3 , nnode ) , disp (3 , nnode ) , mapping (3 , nnode ) )
    allocate ( hght ( nelem ) , wdth ( nelem ) , ym ( nelem ) , EA ( nelem ) , EI ( nelem ) )
    allocate ( s (3* nnode ,3* nnode ) ,u (3* nnode ) )
    allocate ( ine (2 , nelem ) , ibc (3 , nnode ) )

    !!! Initialise the coordinates of nodes.
    do inode =1 , nnode
        read (100 ,*) ( pos (i , inode ), i =1 ,2) !pos(1, inode), pos(2, inode)
    end do
    write(*,*) pos
    j = 0
    do inode = 1 , nnode
        do i = 1, 3
        !???
            mapping (i , inode ) = j
        end do
    end do

    do ielem =1 , nelem
    read (100 ,*) ( ine (i , ielem ) ,i =1 ,2)
    end do
    do ielem =1 , nelem
    !read (100 ,*) ???
    !EA ( ielem ) =???
    !EI ( ielem ) =???
    end do
    do inode =1 , nnode
    !read (100 ,*) ???
    end do
    do inode =1 , nnode
    !read (100 ,*) ???
    end do
    close (100)

end program frame_analysis