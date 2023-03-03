//
//  RectangleButton.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 3.03.2023.
//

import SwiftUI

struct RectangleButton: View {
    var action: () -> Void = {}
    var width: CGFloat = 50
    var height: CGFloat = 70
    var text: String = "Mon"
    
    let colors = [Color("backgroundColor"), Color("backgroundColor2").opacity(0.8)]
    let strokeColors = [Color.cyan,Color.cyan.opacity(0),Color.cyan.opacity(0)]
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: height)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(LinearGradient(gradient: Gradient(colors: strokeColors), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 3))
                        .frame(width: width-1, height: height-1)
                        .overlay {
                            Text(text)
                                .foregroundColor(.white)
                        }
                }
        }
    }
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButton()
    }
}
