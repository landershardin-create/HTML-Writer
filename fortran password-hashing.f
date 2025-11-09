function hash_password(password) result(hashed)
  implicit none
  character(len=*), intent(in) :: password
  character(len=len(password)) :: hashed
  integer :: i

  do i = 1, len(password)
    hashed(i:i) = achar(mod(iachar(password(i:i)) + 3, 126))
  end do
end function hash_password