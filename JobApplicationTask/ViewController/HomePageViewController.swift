import UIKit
import Firebase

class HomePageViewController: UIViewController {
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Homer Simpson"
        label.font = UIFont(name: "AvenirNext-Bold", size: 30)
        label.textColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = UIColor.yellow
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(usernameLabel)
        view.addSubview(logoutButton)
        
        // Constraints for usernameLabel
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Constraints for logoutButton
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            logoutButton.widthAnchor.constraint(equalToConstant: 325),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Target for logoutButton
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    @objc func logoutButtonTapped() {
        // Login sayfasına geri dönme
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "showLoginPage", sender: self)
        } catch {
            print("Error!")
        }
        
    }
}

