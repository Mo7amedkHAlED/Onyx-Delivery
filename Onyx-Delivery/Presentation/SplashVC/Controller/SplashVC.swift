//
//  SplashVC.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let navigationController = UINavigationController()
            navigationController.setViewControllers([LoginVC()], animated: true)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
    }

}
