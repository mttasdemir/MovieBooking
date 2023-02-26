//
//  ContentView.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: Tab = .ticket
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            TabView(selection: $activeTab) {
                Text("Home").tag(Tab.home)
                Text("Category").tag(Tab.category)
                TicketView().tag(Tab.ticket)
                Text("Location").tag(Tab.location)
                Text("Profile").tag(Tab.profile)
            }
            TabBar(selectedTab: $activeTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
