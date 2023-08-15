//
//  HomeUseCase.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 15/08/2023.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    func GetDeliveryBillsItems() -> RxSwift.Observable<DeliveryResponse>
}

class HomeUseCaseImple: HomeUseCase {
    
    private let repo: HomeRepoProtocol
    
    init(repo: HomeRepoProtocol = HomeRepoImple()) {
        self.repo = repo
    }
    
    func GetDeliveryBillsItems() -> RxSwift.Observable<DeliveryResponse> {
        repo.GetDeliveryBillsItems()
    }
}
