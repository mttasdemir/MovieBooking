//
//  TicketView.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 29.01.2023.
//

import SwiftUI

struct TicketView: View {
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

            VStack(spacing: 30.0) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Once you buy a movie ticket simply scan the barcode to access to your movie.")
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 250)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            TicketDeck()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom))
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
            .preferredColorScheme(.light)
    }
}
