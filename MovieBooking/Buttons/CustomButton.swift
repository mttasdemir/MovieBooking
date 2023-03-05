//
//  CustomButton.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 5.03.2023.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        Button {
        } label: {
            Text("Buy")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(width: 80, height: 80, alignment: .center)
                .background(.ultraThinMaterial)
                .background(.gray)
                .cornerRadius(40)
                .shadow(color: Color.black, radius: 5, x: 3, y: 3)
                .overlay {
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.cyan, lineWidth: 3)
                        .rotationEffect(Angle(degrees: 135))
                }
                .background {
                    Rectangle()
                        .fill(.black).opacity(0.4)
                        .frame(width: 110, height: 110)
                        .cornerRadius(40, corners: [UIRectCorner.topLeft, UIRectCorner.bottomLeft])
                }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
