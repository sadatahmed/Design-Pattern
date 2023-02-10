//
//  HomeViewModel.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import Foundation

final class HomeViewModel {
    @Published var welcomeMsg: String?
    
    func loggedInUserWelcomeMsg() {
        let user = NetworkService.shared.getUser()
        welcomeMsg = "Welcom \(user?.firstName ?? "") \(user?.lastName ?? "")"
    }
}
