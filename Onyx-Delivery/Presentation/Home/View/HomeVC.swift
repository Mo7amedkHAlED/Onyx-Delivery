//
//  HomeVC.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import UIKit
import RxCocoa
import RxSwift

class HomeVC: UIViewController {
    // MARK: - Variables
    private let bag = DisposeBag()
    var viewModel: HomeViewModel
    
    // MARK: - Init
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: HomeVC.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController(true)
    }
    
    // MARK: - set Navigation Bar Hidden
    private func setNavigationController(_ isHidden: Bool ) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
}
