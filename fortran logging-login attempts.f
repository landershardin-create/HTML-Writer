subroutine log_attempt(username, success)
  implicit none
  character(len=*), intent(in) :: username
  logical, intent(in) :: success
  character(len=100) :: status
  integer :: unit

  if (success) then
    status = "SUCCESS"
  else
    status = "FAILURE"
  end if

  open(unit=20, file="login_log.txt", status="unknown", position="append")
  write(20, '(A)') trim(username) // "," // trim(status)
  close(20)
end subroutine log_attempt