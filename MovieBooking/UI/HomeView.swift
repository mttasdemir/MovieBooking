//
//  HomeView.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 1.03.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
            CircleBackground(color: Color("cyan"))
                .blur(radius: animate ? 100 : 70)
                .offset(x: animate ? -50 : -20, y: animate ? -100 : -50)
                .task {
                    withAnimation(.easeIn(duration: 4).repeatForever()) {
                        animate.toggle()
                    }
                }
            CircleBackground(color: Color("pink"))
                .blur(radius: animate ? 100 : 70)
                .offset(x: animate ? 100 : 50, y: animate ? 100 : 50)
            ZStack(alignment: .top) {
                Color.blue.opacity(0)
                VStack(spacing: 0.0) {
                    Text("Choose Movie")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                    
                    CustomSearchBar()
                    
                    VStack(spacing: 10) {
                        ScrollSection(section: "Movie Playing", posters: posters1)
                        ScrollSection(section: "Coming Soon", posters: posters2)
                        ScrollSection(section: "Top Movies", posters: posters3)
                    }
                    .padding(.top, 20)
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
