//
//  ContentView.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: .zero) {
                TabView(selection: $activeTab) {
                    HomeView().tag(Tab.home)
                    Text("Category").tag(Tab.category)
                    TicketView().tag(Tab.ticket)
                    Text("Location").tag(Tab.location)
                    Text("Profile").tag(Tab.profile)
                }
                TabBar(selectedTab: $activeTab)
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
