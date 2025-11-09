program login_with_roles
  implicit none
  character(len=20) :: username, password, role
  character(len=100) :: line
  character(len=20), dimension(3) :: fields
  integer :: attempts, max_attempts, i, pos1, pos2
  logical :: found
  character(len=100) :: filepath
  open(unit=10, file="users.txt", status="old", action="read")

  max_attempts = 3
  attempts = 0
  found = .false.

  do while (attempts < max_attempts .and. .not. found)
    print *, "Enter username:"
    read *, username
    print *, "Enter password:"
    read *, password

    rewind(10)
    do
      read(10, '(A)', end=100) line
      pos1 = index(line, ",")
      pos2 = index(line(pos1+1:), ",") + pos1

      fields(1) = adjustl(line(1:pos1-1))               ! username
      fields(2) = adjustl(line(pos1+1:pos2-1))          ! password
      fields(3) = adjustl(line(pos2+1:))                ! role

      if (trim(username) == trim(fields(1)) .and. trim(password) == trim(fields(2))) then
        role = trim(fields(3))
        found = .true.
        exit
      end if
    end do
100 continue

    if (.not. found) then
      print *, "Invalid credentials. Try again."
      attempts = attempts + 1
    end if
  end do

  if (found) then
    print *, "Login successful! Role:", role
    select case (role)
    case ("admin")
      print *, "Access granted to admin dashboard."
    case ("user")
      print *, "Access granted to user dashboard."
    case ("editor")
      print *, "Access granted to editor tools."
    case default
      print *, "Unknown role. Limited access."
    end select
  else
    print *, "Too many failed attempts. Access denied."
  end if

  close(10)
end program login_with_roles