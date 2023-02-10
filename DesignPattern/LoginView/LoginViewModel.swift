//
//  LoginViewModel.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import Foundation

final class LoginViewModel {
    @Published var error: String?
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.error = success ? nil : "Invalid Credentials!!"
        }
    }
}
