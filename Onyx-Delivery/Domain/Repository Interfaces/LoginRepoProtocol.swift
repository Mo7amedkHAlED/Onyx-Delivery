//
//  LoginRepoProtocol.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import Foundation
import RxSwift

protocol LoginRepoProtocol {
    func fetchUserData(userID: String, password: String) -> RxSwift.Observable<UserData>
}
