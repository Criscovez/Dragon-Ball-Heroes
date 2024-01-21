//
//  LoginViewController.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 15-01-24.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Model
    private let model = NetworkModel.shared
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func didTapContinueButton(_ sender: Any) {
        model.login(
            user: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(_):
                // ViewController de Heroes
                DispatchQueue.main.async {
                    
                    let heroesListTableViewController = HeroesListTableViewController()
                    self.navigationController?.setViewControllers([heroesListTableViewController], animated: true)
                }
                break
            case let .failure(error):
                print("🔴 \(error)")
            }
        }
    }
}

