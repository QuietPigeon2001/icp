program vector
implicit none
integer, parameter:: n=3
real(8):: a(n), b(n), c(n), d(n), e(n), f(n), g(n), ba(n), bc(n), bd(n), da(n), dc(n), dg(n), df(n), de(n), ac(n), ef(n), fg(n)
real(8):: ge(n), u(3), v(3), cp(3), x(3)
real(8):: a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, e1, e2, e3,  f1, f2, f3, g1, g2, g3, defg, dabc, eefg, aabc, sa, vol_dabc
real(8):: vol_dgef
real(8):: def(n), dfg(n), dge(n), dab(n), dbc(n), dca(n), efg(n), abc(n)

call get_data

! output
write(*,*) "Coordinates of vertices"
write(*,*) repeat("--", 30)
write(*,'(a3, 3(2x, f8.3))') "A", a
write(*,'(a3, 3(2x, f8.3))') "B", b
write(*,'(a3, 3(2x, f8.3))') "C", c
write(*,'(a3, 3(2x, f8.3))') "D", d
write(*,'(a3, 3(2x, f8.3))') "E", e
write(*,'(a3, 3(2x, f8.3))') "F", f
write(*,'(a3, 3(2x, f8.3))') "G", g

write(*,*)

write(*,*) "Vectors of edges and their magnitudes"
write(*,*) repeat("--", 30)
! Vij = I-J
ba = a - b
bc = c - b
bd = d - b
da = a - d
dc = c - d
dg = g - d
df = f - d
de = e - d
ac = c - a
ef = f - e
fg = g - f
ge = e - g

write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "BA", ba, "|BA| = ", magnitudeOf(ba)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "BC", bc, "|BC| = ", magnitudeOf(bc)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "BD", bd, "|BD| = ", magnitudeOf(bd)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "DA", da, "|DA| = ", magnitudeOf(da)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "DC", dc, "|DC| = ", magnitudeOf(dc)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "DG", dg, "|DG| = ", magnitudeOf(dg)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "DF", df, "|DF| = ", magnitudeOf(df)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "DE", de, "|DE| = ", magnitudeOf(de)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "AC", ac, "|AC| = ", magnitudeOf(ac)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "EF", ef, "|EF| = ", magnitudeOf(ef)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "FG", fg, "|FG| = ", magnitudeOf(fg)
write(*,'(a3, 3(2x, f8.3), 4x, a6, f8.3)') "GE", ge, "|GE| = ", magnitudeOf(ge)

write(*,*)

write(*,*) "Polygon ABCFGE"
write(*,*) repeat("==", 30)
! surface area
! find surface area of pyramid abcd
def = crossProduct(de, df)
dfg = crossProduct(df, dg)
dge = crossProduct(dg, de) 
defg = 0.5*(magnitudeOf(def) + magnitudeOf(dfg) + magnitudeOf(dge))
! find surface area of pyramid dabc
dab = crossProduct(da, bd)
dbc = crossProduct(bd, dc)
dca = crossProduct(dc, da)
dabc = 0.5*(magnitudeOf(dab) + magnitudeOf(dbc) + magnitudeOf(dca))
! find surface area of triangle efg
efg = crossProduct(ef, fg)
eefg = 0.5*magnitudeOf(efg)
! find surface area of triangle abc
abc = crossProduct(ba, bc)
aabc = 0.5*magnitudeOf(abc)
! find total surface area 
sa = (dabc - defg) + eefg + aabc
write(*,'(a15, 4x, f8.3)') "Surface area = ", sa

!volume
vol_dabc = abs(dot_product(da, crossProduct(bd,dc)))/6
vol_dgef = abs(dot_product(de, crossProduct(df, dg)))/6
write(*,'(a15, 4x, f8.3)') "Volume = ", vol_dabc - vol_dgef


contains 
        ! calculates the cross product of two vectors
        function crossProduct(u,v)
            real(8):: crossProduct(3)
            real(8):: u(3), v(3), cp(3)
            cp(1) = u(2)*v(3) - u(3)*v(2)
            cp(2) = u(3)*v(1) - u(1)*v(3)
            cp(3) = u(1)*v(2) - u(2)*v(1)
            crossProduct = cp
        end function
        
        ! calculates magnitude of vector
        function magnitudeOf(x)
                real(8):: magnitudeOf, x(3), s
                s = x(1)**2 + x(2)**2 + x(3)**2
                magnitudeOf = s**0.5
        end function

        ! generates vectors from input file
        subroutine get_data
                ! opens file
                open (1, file='coord.txt')
                ! reads file
                read(1,*) a(1), a(2), a(3)
                read(1,*) b(1), b(2), b(3)
                read(1,*) c(1), c(2), c(3)
                read(1,*) d(1), d(2), d(3)
                read(1,*) e(1), e(2), e(3)
                read(1,*) f(1), f(2), f(3)
                read(1,*) g(1), g(2), g(3)
        end subroutine get_data

end program vector
