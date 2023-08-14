//
//  LoginRepoImple.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import Foundation
import RxSwift

class LoginRepoImple: LoginRepoProtocol {
    
    private let networkService : APIService
    
    init(networkService: APIService = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - Fetch User Data
    func fetchUserData(userID: String, password: String) -> RxSwift.Observable<UserData> {
        let baseUrl = URL(string: "\(Constants.baseUrl)\(Constants.checkDeliveryLogin)")!
        
        let requestBody = [
            "Value": [
                "P_LANG_NO": Constants.LanguageNU,
                "P_DLVRY_NO": userID,
                "P_PSSWRD": password
            ]
        ]
        
        do {
            let requestBodyData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            
            var request = URLRequest(url: baseUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = requestBodyData
            
            return networkService.fetch(urlRequest: request)
                .asObservable()
                .flatMap { data -> Observable<UserData> in
                    do {
                        let user = try JSONDecoder().decode(UserData.self, from: data)
                        return Observable.just(user)
                    } catch {
                        return Observable.error(error) // More specific error handling here
                    }
                }
        } catch {
            return Observable.error(error) // More specific error handling here
        }
    }
}
