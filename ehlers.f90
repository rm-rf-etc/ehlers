module smooth

implicit none

contains

subroutine laguerre(input,factor,n,output)
    real*8,dimension(n),intent(in) :: input
    real*8,dimension(n),intent(out) :: output
    real*8 :: alpha
    real*8 :: alpha1
    real*8 :: factor
    real*8,dimension(8) :: L
    integer,intent(in) :: n
    integer :: i
    integer :: j

    if (factor > 1.0) then
        alpha = 2.0 / (factor + 1.0)
    else
        alpha = factor
    endif
    alpha1 = 1.0 - alpha

    ! pre-fill L
    do i = 1,8
        L(i) = input(1)
    enddo

    do i = 1,n
        L(1) = alpha * input(i) + alpha1 * L(2)
        L(3) = -alpha1 * L(1) + L(2) + alpha1 * L(4)
        L(5) = -alpha1 * L(3) + L(4) + alpha1 * L(6)
        L(7) = -alpha1 * L(5) + L(6) + alpha1 * L(8)

        output(i) = (L(1) + 2.0 * L(3) + 2.0 * L(5) + L(7)) / 6.0

        do j = 0,6
            L(8-j) = L(8-j-1)
        enddo
    enddo
end subroutine

end module smooth
