import UIKit

class LoginViewController: UIViewController {

    // UI Elements
    let usernameField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        // Configure text fields and button (layout code omitted for brevity)
        usernameField.placeholder = "Username"
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        // Add to view and layout...
    }

    @objc func handleLogin() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        // Simple hardcoded check (replace with secure backend call)
        if username == "admin" && password == "password123" {
            showAlert(title: "Success", message: "Logged in!")
        } else {
            showAlert(title: "Error", message: "Invalid credentials.")
        }
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}