import UIKit
import Firebase
import FirebaseAuth

class CreateAccountPageViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.font = UIFont(name: "AvenirNext-Bold", size: 30)
        label.textColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.font = UIFont(name: "AvenirNext-Bold", size: 18)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = UIColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.font = UIFont(name: "AvenirNext-Bold", size: 18)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = UIColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        textField.font = UIFont(name: "AvenirNext-Bold", size: 18)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = UIColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont(name: "AvenirNext-Bold", size: 18)
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = UIColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.backgroundColor = UIColor.yellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = UIColor.red
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setupViews()
        
        // Add targets for buttons
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(createAccountButton)
        view.addSubview(cancelButton)
        
        // Constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        
        // Constraints for nameTextField
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for surnameTextField
        NSLayoutConstraint.activate([
            surnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            surnameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            surnameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for emailTextField
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 15),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for passwordTextField
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for createAccountButton
        NSLayoutConstraint.activate([
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -15),
            createAccountButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
                
        // Constraints for cancelButton
        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func createAccountButtonTapped() {
        
    if nameTextField.text != "" && surnameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
    Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
        if error != nil {
        self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Username or Password is incorrect, Try again please!")
        } else {
        self.performSegue(withIdentifier: "showHomePage", sender: self)
        }
        }
    } else {
    makeAlert(title: "Error!", message: "Username or Password is incorrect, Try again please!")
    }
    }
    
    @objc func cancelButtonTapped() {
        performSegue(withIdentifier: "showLoginPage", sender: self)
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

