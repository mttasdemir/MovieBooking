//
//  MyUtils.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 6.02.2023.
//

import SwiftUI

struct MyCornerRadius: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(bezierPath.cgPath)
    }
}

extension View {
    func myCornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(MyCornerRadius(radius: radius, corners: corners))
    }
}
