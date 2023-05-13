//
//  AppListView.swift
//  TopApps
//
//  Created by APPSPIA on 2022/06/14.
//

import SwiftUI

struct AppListView: View {
    @ObservedObject var viewModel: AppListViewModel
    var title: String
    
    init(title: String, api: API<TopAppsModel.TopApps>) {
        self.viewModel = AppListViewModel(api: api)
        self.title = title
    }
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView().progressViewStyle(.automatic)
            } else {
                let itemWithIndex = viewModel.items.enumerated().map({ $0 })
                List(itemWithIndex, id: \.element.id) { index, item in
                    ZStack {
                        AppListCell(item: item, ranking: index + 1)
                        NavigationLink(destination: AppDetailView(item: item)) {
                            EmptyView()
                        }.opacity(0)
                    }
                }.listRowInsets(.none) .listStyle(.plain).navigationTitle(title)
            }
        }
    }
}
