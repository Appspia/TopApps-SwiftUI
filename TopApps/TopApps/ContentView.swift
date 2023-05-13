//
//  ContentView.swift
//  TopApps
//
//  Created by APPSPIA on 2022/06/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AppListView(title: "TOP FREE APPS", api: .free).tabItem {
                Image("no-cash").renderingMode(.template)
                Text("TOP FREE APPS")
            }
            AppListView(title: "PAID", api: .paid).tabItem {
                Image("rank").renderingMode(.template)
                Text("PAID")
            }
            AppListView(title: "GROSSING", api: .grossing).tabItem {
                Image("trophy").renderingMode(.template)
                Text("GROSSING")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
