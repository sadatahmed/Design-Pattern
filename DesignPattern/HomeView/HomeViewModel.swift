//
//  HomeViewModel.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import Foundation

final class HomeViewModel {
    var welcomeMsg: ObservableObject<String?> = ObservableObject(nil)
    
    func loggedInUserWelcomeMsg() {
        let user = NetworkService.shared.getUser()
        welcomeMsg.value = "Welcom \(user?.firstName ?? "") \(user?.lastName ?? "")"
    }
}
