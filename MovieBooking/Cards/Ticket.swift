//
//  Ticket.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 5.02.2023.
//

import SwiftUI

struct Ticket: View {
    let ticket: TicketModel
    var height: CGFloat = .zero
    
    var body: some View {
        VStack(spacing: 2.0) {
            VStack(spacing: 4.0) {
                Text(ticket.title)
                    .fontWeight(.bold)
                Text(ticket.subtitle)
            }
            .foregroundColor(.white)
            .frame(width: 250, height: 325, alignment: .top)
            .background(
                Image(ticket.top)
            )
            .myCornerRadius(radius: 30, corners: [UIRectCorner.topLeft, UIRectCorner.topRight])
            
            Spacer(minLength: height)
            
            VStack {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [6, 4]))
                    .frame(width: 200, height: 1)

            }
            
            VStack {
                HStack {
                    HStack(spacing: 4.0) {
                        Text("Date:").foregroundColor(Color("lightPurple"))
                            .fontWeight(.medium)
                        Text("April 23").foregroundColor(.black)
                    }
                    HStack(spacing: 4.0) {
                        Text("Time:").foregroundColor(Color("lightPurple"))
                            .fontWeight(.medium)
                        Text("4 p.m.").foregroundColor(.black)
                    }
                }
                HStack {
                    HStack(spacing: 4.0) {
                        Text("Row:").foregroundColor(Color("lightPurple"))
                            .fontWeight(.medium)
                        Text("2").foregroundColor(.black)
                    }
                    HStack(spacing: 4.0) {
                        Text("Seats:").foregroundColor(Color("lightPurple"))
                            .fontWeight(.medium)
                        Text("9, 10").foregroundColor(.black)
                    }
                }
                Image("code")

            }
            .frame(width: 250, height: 135)
            .background(.ultraThinMaterial)
            .background(
                Image(ticket.bottom)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .mask(
                Image(ticket.bottom)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
        }
        .frame(height: 450)
        .shadow(radius: 10)
    }
}

struct Ticket_Previews: PreviewProvider {
    static var previews: some View {
        Ticket(ticket: ticketSamples[0])
    }
}
