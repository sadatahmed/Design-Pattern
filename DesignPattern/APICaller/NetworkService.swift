//
//  NetworkService.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private var user: User?
    
    private init() { }
    
    func login(email: String, password: String, completion: @escaping(Bool)-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "sadat@gmail.com" && password == "11111" {
                self?.user = User(firstName: "Sadat", lastName: "Ahmed", email: "sadat@gmail.com", password: "11111", age: 25)
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getUser() -> User? {
        guard let user = user else { return nil }
        return user
    }
}
