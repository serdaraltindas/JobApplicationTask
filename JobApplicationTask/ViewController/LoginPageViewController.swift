import UIKit
import Firebase
import FirebaseCore

class LoginPageViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

    let rememberMeCheckBox: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Remember me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 14)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let checkBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var isRememberMeChecked = false {
        didSet {
            checkBoxImageView.image = UIImage(systemName: isRememberMeChecked ? "checkmark.square" : "square")
        }
    }

    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password ?", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login Now", for: .normal)
        button.backgroundColor = UIColor.yellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't Have an Account?"
        label.textColor = UIColor.white
        label.font = UIFont(name: "AvenirNext-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let createOneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create one", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        // Add targets for buttons
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        createOneButton.addTarget(self, action: #selector(createOneButtonTapped), for: .touchUpInside)
        rememberMeCheckBox.addTarget(self, action: #selector(rememberMeCheckBoxTapped), for: .touchUpInside)
    }

    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(checkBoxImageView)
        view.addSubview(rememberMeCheckBox)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(createAccountLabel)
        view.addSubview(createOneButton)

        // Constraints for backgroundImageView
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Constraints for logoImageView
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])

        // Constraints for emailTextField
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -15),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Constraints for passwordTextField
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: rememberMeCheckBox.topAnchor, constant: -5),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Constraints for checkBoxImageView
        NSLayoutConstraint.activate([
            checkBoxImageView.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            checkBoxImageView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15),
            checkBoxImageView.widthAnchor.constraint(equalToConstant: 20),
            checkBoxImageView.heightAnchor.constraint(equalToConstant: 20)
        ])

        // Constraints for rememberMeCheckBox
        NSLayoutConstraint.activate([
            rememberMeCheckBox.leadingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor, constant: 5),
            rememberMeCheckBox.centerYAnchor.constraint(equalTo: checkBoxImageView.centerYAnchor),
            rememberMeCheckBox.widthAnchor.constraint(equalToConstant: 150),
            rememberMeCheckBox.heightAnchor.constraint(equalToConstant: 30)
        ])

        // Constraints for forgotPasswordButton
        NSLayoutConstraint.activate([
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        // Constraints for loginButton
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: createAccountLabel.topAnchor, constant: -10),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Constraints for createAccountLabel and createOneButton
        NSLayoutConstraint.activate([
            createAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            createAccountLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            createAccountLabel.heightAnchor.constraint(equalToConstant: 50),
            
            createOneButton.leadingAnchor.constraint(equalTo: createAccountLabel.trailingAnchor, constant: 5),
            createOneButton.centerYAnchor.constraint(equalTo: createAccountLabel.centerYAnchor),
            createOneButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func loginButtonTapped() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (auth, error) in
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

    @objc func createOneButtonTapped() {
        performSegue(withIdentifier: "CreateAccountPage", sender: self)
    }

    @objc func rememberMeCheckBoxTapped() {
        isRememberMeChecked.toggle()
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
