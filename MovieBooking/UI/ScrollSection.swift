//
//  ScrollSection.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 1.03.2023.
//

import SwiftUI

struct ScrollSection: View {
    let section: String
    let posters: Array<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text(section)
                .font(.headline)
                .foregroundColor(.white)
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(posters, id: \.self) { poster in
                        NavigationLink {
                            BookingView()
                        } label: {
                            Image(poster)
                                .cornerRadius(15, corners: [UIRectCorner.topLeft, UIRectCorner.bottomRight])
                            //.clipShape(RoundedCorner(radius: 15))
                        }
                    }
                }
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection(section: "Movie Playing", posters: posters1)
    }
}
