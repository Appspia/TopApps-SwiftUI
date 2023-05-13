//
//  AppDetailView.swift
//  TopApps
//
//  Created by APPSPIA on 2022/06/14.
//

import SwiftUI
import StoreKit
import Kingfisher

struct AppDetailView: View {
    @State var item: TopAppsModel.Entry
    @State private var appStoreButtonPresented = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center, spacing: 16) {
                    KFImage(URL(string: item.imImage?.last?.label ?? ""))
                        .resizable()
                        .cancelOnDisappear(true)
                        .frame(width: 90, height: 90)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 0.5)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(item.title?.label ?? "").font(.system(size: 15, weight: .bold))
                        Text(item.category?.attributes?.label ?? "").font(.system(size: 12)).foregroundColor(.secondary)
                    }
                    Spacer()
                    Button(item.imPrice?.label ?? "") {
                        appStoreButtonPresented = true
                    }.buttonStyle(.bordered).appStoreOverlay(isPresented: $appStoreButtonPresented) {
                        SKOverlay.AppConfiguration(appIdentifier: item.entryid?.attributes?.imid ?? "", position: .bottomRaised)
                    }
                }
                Text(item.summary?.label ?? "")
            }.padding()
        }.navigationBarTitleDisplayMode(.inline)
    }
}
