//
//  TabBar.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 25.02.2023.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Tab
    let backgroundColors = [Color("pink"), Color("lightBlue"), Color("purple")]
    let circleColors = [Color("cyan"),Color("cyan").opacity(0.25),Color("cyan")]
    @State private var offsetValue: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometryProxy in
            let width = geometryProxy.size.width / Double(Tab.allCases.count)
            HStack {
                ForEach(Tab.allCases) { tab in
                    Spacer()
                    Button {
                        withAnimation(.easeInOut) {
                            selectedTab = tab
                            offsetValue(width)
                        }
                    } label: {
                        Image(tab.rawValue)
                            .renderingMode(.original)
                            .offset(y: tab == selectedTab ? -12 : 0)
                    }
                    Spacer()
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 30)
            .background(alignment: .leading) {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: width, height: width)
                    .offset(x: offsetValue, y: -12)
                    .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 10)
                    .overlay {
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(LinearGradient(colors: circleColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 3))
                            .rotationEffect(Angle(degrees: 135))
                            .offset(x: offsetValue, y: -12)
                            .frame(width: width-5, height: width-5)
                    }
            }
            .background(.ultraThinMaterial)
            .background(LinearGradient(colors: backgroundColors, startPoint: .leading, endPoint: .trailing))
        }
        .frame(height: 54)
    }
    
    private func offsetValue(_ width: Double) {
        offsetValue = width * Double(selectedTab.index)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.ticket))
    }
}
