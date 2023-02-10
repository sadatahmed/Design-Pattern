//
//  HomeViewController.swift
//  DesignPattern
//
//  Created by apple on 2023/02/09.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    private var cancellables: Set<AnyCancellable> = []
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        binding()
        viewModel.loggedInUserWelcomeMsg()
    }
    
    func binding() {
        viewModel.$welcomeMsg.sink { [weak self] msg in
            self?.welcomeLbl.text = msg
        }.store(in: &cancellables)
    }
}
