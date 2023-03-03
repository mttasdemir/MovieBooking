//
//  BookingView.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 2.03.2023.
//

import SwiftUI

struct BookingView: View {
    @State private var isDateSelected: Bool = false
    @State private var dateSelected: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Color.blue.opacity(0)
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 500)
                HStack {
                    CircleButton {}
                    Spacer()
                    CircleButton(action: {}, image: "ellipsis")
                }
                .padding(EdgeInsets(top: 20, leading: 15, bottom: 5, trailing: 15))
            }
            .ignoresSafeArea()
            
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    DateButton(weekDay: "Mon", numDay: "1", isSelected: $isDateSelected)
                        .offset(y: 60)
                    DateButton(weekDay: "Mon", numDay: "1", isSelected: $isDateSelected)
                        .offset(y: 30)
                    DateButton(weekDay: "Mon", numDay: "1", width: 70, height: 100, isSelected: $dateSelected) {
                        withAnimation { dateSelected.toggle() }
                    }
                    DateButton(weekDay: "Mon", numDay: "1", isSelected: $isDateSelected)
                        .offset(y: 30)
                    DateButton(weekDay: "Mon", numDay: "1", isSelected: $isDateSelected)
                        .offset(y: 60)
                }
                HStack(spacing: 15) {
                    TimeButton(hour: "2pm", isSelected: $isDateSelected)
                        .offset(y: 60)
                    TimeButton(hour: "2pm", isSelected: $isDateSelected)
                        .offset(y: 30)
                    TimeButton(hour: "2pm", width: 70, height: 70, isSelected: $dateSelected) {
                        withAnimation { dateSelected.toggle() }
                    }
                    TimeButton(hour: "2pm", isSelected: $isDateSelected)
                        .offset(y: 30)
                    TimeButton(hour: "2pm", isSelected: $isDateSelected)
                        .offset(y: 60)
                }
                Color.blue.opacity(0)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom))
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
