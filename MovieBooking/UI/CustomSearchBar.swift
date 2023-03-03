//
//  CustomSearchBar.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 1.03.2023.
//

import SwiftUI

struct CustomSearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText)
            Image(systemName: "mic.fill")
        }
        .font(.title2)
        .frame(height: 40)
        .background(in: RoundedRectangle(cornerRadius: 10))
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .ignoresSafeArea(.keyboard)
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar()
    }
}
