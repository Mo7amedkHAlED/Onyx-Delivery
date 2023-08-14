//
//  LoginUseCase.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import Foundation
import RxSwift

protocol LoginUseCase {
    func fetchUserData(userID: String, password: String) -> RxSwift.Observable<UserData>
}
class LoginUseCaseImple: LoginUseCase {
    // MARK: - Variables
    private let repo: LoginRepoProtocol
    
    // MARK: - Init
    init(repo: LoginRepoProtocol = LoginRepoImple()) {
        self.repo = repo
    }

    func fetchUserData(userID: String, password: String) -> RxSwift.Observable<UserData> {
        repo.fetchUserData(userID: userID, password: password)
    }
    
    
    
}
