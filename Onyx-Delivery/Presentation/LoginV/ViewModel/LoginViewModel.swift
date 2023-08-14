//
//  LoginViewModel.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel {
    let userIDTextField: BehaviorRelay<String> = .init(value: "")
    let password: BehaviorRelay<String> = .init(value: "")
    let showAlert = PublishSubject<String>()
    let successLogin: BehaviorRelay<Bool> = .init(value: false)
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    private let loginUseCase: LoginUseCase
    private let bag = DisposeBag()
    // MARK: - Init
    init(loginUseCase: LoginUseCase = LoginUseCaseImple()) {
        self.loginUseCase = loginUseCase
    }
    // MARK: - viewDidLoad
    func viewDidLoad() {
        checkLoginData()
    }
    // Subscribe User Information Input
    func checkLoginData() {
        guard !userIDTextField.value.isEmpty && !password.value.isEmpty else {
            showAlert.onNext(AppError.enterAllFields.localizedDescription)
            return
        }
        loadingBehavior.accept(true)
        loginUseCase.fetchUserData(userID: userIDTextField.value, password: password.value).subscribe(onNext: { [weak self] data in
            guard let self = self else {return}
            if data.Result?.ErrMsg == "Successful"{
                self.successLogin.accept(true)
                self.loadingBehavior.accept(false)
            } else {
                self.loadingBehavior.accept(false)
                self.successLogin.accept(false)
                self.showAlert.onNext(AppError.invalidEmailOrPassword.localizedDescription)

            }
        }).disposed(by: bag)
        
    }
}
