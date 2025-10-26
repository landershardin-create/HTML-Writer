<?php
session_start();

// Example: Replace with your actual database connection
$users = [
  'admin' => password_hash('securepassword123', PASSWORD_DEFAULT)
];

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if (isset($users[$username]) && password_verify($password, $users[$username])) {
  $_SESSION['user'] = $username;
  echo "Login successful. Welcome, $username!";
} else {
  echo "Invalid username or password.";
}
?>