//
//  HomeViewController.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        binding()
        viewModel.loggedInUserWelcomeMsg()
    }
    
    func binding() {
        viewModel.welcomeMsg.bind { [weak self] msg in
            self?.welcomeLbl.text = msg
        }
    }
}
