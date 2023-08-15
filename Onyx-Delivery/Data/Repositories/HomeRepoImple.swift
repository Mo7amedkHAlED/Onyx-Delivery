//
//  HomeRepoImple.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 15/08/2023.
//

import Foundation
import RxSwift

class HomeRepoImple: HomeRepoProtocol {
    
    private let networkService : APIService
    
    init(networkService :APIService = NetworkService()){
        self.networkService = networkService
    }
    // MARK: - Get Delivery Bills Items
    func GetDeliveryBillsItems() -> RxSwift.Observable<DeliveryResponse> {
        let baseUrl = URL(string: "\(Constants.baseUrl)\(Constants.getDeliveryBillsItems)")!
        let userID = UserDefaults.standard.string(forKey: "userID")!
        let requestBody = [
            "Value": [
                "P_DLVRY_NO": userID,
                "P_LANG_NO": Constants.LanguageNU
            ]
        ]
        do {
            
            let requestBodyData = try JSONSerialization.data(withJSONObject: requestBody,options: [])
            var request = URLRequest(url: baseUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = requestBodyData
            return networkService.fetch(urlRequest: request).asObservable().flatMap { data -> Observable <DeliveryResponse> in
                do {
                    let deliveryBillsItems = try JSONDecoder().decode(DeliveryResponse.self, from: data)
                    return Observable.just(deliveryBillsItems)
                } catch {
                    return Observable.error(error)
                }
            }
        } catch {
            return Observable.error(error)
        }
        
    }
    
    
}
