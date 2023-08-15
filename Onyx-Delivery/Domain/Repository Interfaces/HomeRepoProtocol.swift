//
//  HomeRepoProtocol.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 15/08/2023.
//

import Foundation
import RxSwift

protocol HomeRepoProtocol {
    func GetDeliveryBillsItems() -> RxSwift.Observable<DeliveryResponse>
}
