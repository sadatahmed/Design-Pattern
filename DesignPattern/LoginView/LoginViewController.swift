//
//  ViewController.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorMsgLbl: UILabel!
    
    private var cancellables: Set<AnyCancellable> = []
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        binders()
    }
    
    func binders() {
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                self?.errorMsgLbl.text = error
                print(error)
            } else {
                self?.goToHomePage()
            }
        }.store(in: &cancellables)
    }
    
    private func goToHomePage() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        present(controller, animated: true)
    }

    @IBAction func loginBtnTapped(_ sender: UIButton) {
        guard let email = emailTF.text, let password = passwordTF.text else { return }
        viewModel.login(email: email, password: password)
    }
}

