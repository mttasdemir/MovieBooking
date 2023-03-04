//
//  LargeButton.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 4.03.2023.
//

import SwiftUI

struct LargeButton: View {
    var label: String = "Reservation"
    let colors = [Color("pink"), Color("backgroundColor")]
    
    var body: some View {
        VStack {
            Text(label)
                .font(.title2)
                .foregroundColor(.white)
                .bold()
        }
        .padding(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 80))
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton()
    }
}
