//
//  AppListViewModel.swift
//  TopApps
//
//  Created by APPSPIA on 2022/06/14.
//

import Foundation
import Combine
import SwiftUI

class AppListViewModel: ObservableObject {
    @Published var items: [TopAppsModel.Entry] = []
    @Published var isLoading: Bool = true
    var api: API<TopAppsModel.TopApps>
    var cancellables = Set<AnyCancellable>()
    
    init(api: API<TopAppsModel.TopApps>) {
        self.api = api
        requestData()
    }
    
    func requestData() {
        isLoading = true
        api.request.sink { result in
            self.isLoading = false
            switch result {
            case .success(let items):
                self.items = items.feed.entry
            case .failure:
                break
            }
        }.store(in: &cancellables)
    }
}
