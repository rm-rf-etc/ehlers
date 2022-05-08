module lagu

implicit none

contains

Subroutine LaguerreNoIntent(x,y,z)
real x,y,z
! This subroutine will not pass result back to Python,
! since f2py assumes INTENT(IN) instead of INTENT(INOUT) like
! plain FORTRAN compilers
z = x * y

End Subroutine


Subroutine LaguerreIntent(x,y,z)
! This subroutine will pass result back to Python
! Note that intent(in) is not invincible, subroutines called by
! subroutines can modify the original variable IF the 2nd subroutine
! doesn't have Intent(in)
real,Intent(In) :: x,y
real,Intent(Out):: z

z = x * y

End Subroutine


Subroutine LaguerreInOut(x,y,z)
! This subroutine will pass result back to Python IN PLACE, not on the left-hand
! of the equals sign! Requires ndarray on inout variable even for scalar cases!
real, Intent(In) :: x,y
real, Intent(inout)  :: z
z = x * y
End Subroutine

Pure Real Function laguerrepure(x,y)
! Elemental & Pure functions require intent declaration
real, Intent(in) :: x,y

laguerrepure = x*y

End Function

end module lagu
