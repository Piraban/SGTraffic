//
//  TrafficMapViewModal.swift
//  SGTraffic
//
//  Created by tigerspike on 18/12/20.
//

import SwiftUI
import Combine


final class TrafficMapViewModal: ObservableObject {
    // MARK:- Subscribers
    private var cancellable: AnyCancellable?
    // MARK:- Publishers
    @Published var trafficsData: [Traffic] = []
    @Published var loading = false
    @Published var isSuccess = false
    @Published var isFailed = false

}

//MARK:- List Payment cards Network API call
extension TrafficMapViewModal {
    func getTrafficList() {
        self.loading = true
        cancellable = SGTrafficService.getAllTrafics(.listTraffics)
            .print()
            .mapError({ (error) -> Error in
                print(error)
                self.loading = false
                self.isFailed = true
                return error
            })
            .sink(receiveCompletion: { (completion) in
                switch completion {
                    case .finished : self.loading = false
                    case .failure( _) : self.isFailed = true
                }
            },
            receiveValue: {
                print("----\($0.listTraffics[0].cameras)")
                self.trafficsData = $0.listTraffics
            })
    }

}

