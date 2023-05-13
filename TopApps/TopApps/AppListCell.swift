//
//  AppListCell.swift
//  TopApps
//
//  Created by APPSPIA on 2022/06/14.
//

import SwiftUI
import StoreKit
import Kingfisher

struct AppListCell: View {
    @State var item: TopAppsModel.Entry
    @State var ranking: Int
    @State var appStoreButtonPresented = false
    
    var body: some View {
        HStack {
            KFImage(URL(string: item.imImage?.last?.label ?? ""))
                .resizable()
                .cancelOnDisappear(true)
                .frame(width: 60, height: 60)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 0.5)
                )
            
            Text("\(ranking)").font(.system(size: 12))
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title?.label ?? "").font(.system(size: 12, weight: .bold))
                Text(item.category?.attributes?.label ?? "").font(.system(size: 12)).foregroundColor(.secondary)
            }
            Spacer()
            Button(item.imPrice?.label ?? "") {
                appStoreButtonPresented = true
            }.buttonStyle(.bordered).appStoreOverlay(isPresented: $appStoreButtonPresented) {
                SKOverlay.AppConfiguration(appIdentifier: item.entryid?.attributes?.imid ?? "", position: .bottomRaised)
            }
        }
    }
}
