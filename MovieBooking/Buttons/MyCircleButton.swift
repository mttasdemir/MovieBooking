//
//  MyCircleButton.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 3.03.2023.
//

import SwiftUI

struct MyCircleButton: View {
    var imageName: String = "arrow.left"
    var colors = [Color.cyan, Color.cyan.opacity(0.4), Color.cyan]
    var action: () -> Void = {}
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .padding(15)
                .foregroundColor(.white)
                .background {
                    Circle()
                        .fill(.gray)
                        .opacity(0.7)
                        .shadow(color: .black, radius: 5, x: 2, y: 2)
                        .overlay {
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .stroke(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2))
                                .rotationEffect(Angle(degrees: 135))
                        }
                }
        }
    }
}

struct MyCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        MyCircleButton()
    }
}
