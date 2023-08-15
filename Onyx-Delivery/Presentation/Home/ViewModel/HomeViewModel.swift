//
//  HomeViewModel.swift
//  Onyx-Delivery
//
//  Created by Mohamed Khaled on 14/08/2023.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel {
    private let homeUseCase: HomeUseCase
    private let bag = DisposeBag()
    var deliveryBill: BehaviorRelay<[DeliveryBill]> = .init(value: [])
    var tag = 1
    init(homeUseCase: HomeUseCase = HomeUseCaseImple()) {
        self.homeUseCase = homeUseCase
    }
    // MARK: - viewDidLoad
    func viewDidLoad() {
        GetDeliveryBillsItems()
    }
    
    func GetDeliveryBillsItems() {
        homeUseCase.GetDeliveryBillsItems().subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            switch self.tag == 1 {
            case true:
                let filteredBillsWithFlag0 = data.Data?.DeliveryBills.filter { $0.DLVRY_STATUS_FLG == "0" } ?? []
                self.deliveryBill.accept(filteredBillsWithFlag0)
                
            case false:
                let filteredBillsWithFlagOther = data.Data?.DeliveryBills.filter { $0.DLVRY_STATUS_FLG != "0" } ?? []
                self.deliveryBill.accept(filteredBillsWithFlagOther)
            }
        }).disposed(by: bag)
    }
}
