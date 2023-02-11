//
//  TicketDeck.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 11.02.2023.
//

import SwiftUI

struct TicketDeck: View {
    @State private var ticketDeck = ticketSamples
    var body: some View {
        ZStack {
            ForEach(ticketDeck) { ticket in
                InfiniteStackView($ticketDeck, ticket)
            }
        }
    }
}

struct TicketDeck_Previews: PreviewProvider {
    static var previews: some View {
        TicketDeck()
    }
}

struct InfiniteStackView: View {
    @Binding var ticketDeck: Array<TicketModel>
    let ticket: TicketModel
    @State private var height: CGFloat = .zero
    
    init(_ ticketDeck: Binding<[TicketModel]>, _ ticket: TicketModel) {
        self._ticketDeck = ticketDeck
        self.ticket = ticket
    }
    
    @GestureState var dragValue: CGFloat = .zero
    var dragGesture: some Gesture {
        DragGesture()
            .updating($dragValue) { currentValue, state, _ in
                state = currentValue.translation.width
            }
            .onChanged { currentValue in
                let value = currentValue.translation.width
                if value < 0 {
                   height = (-value/screenWidth)*40
                }
            }
            .onEnded { currentValue in
                let swipeRight = currentValue.translation.width > screenWidth/2
                let swipeLeft = -currentValue.translation.width > screenWidth/2
                if swipeRight {
                    moveToBackOfDeck()
                }
                if swipeLeft {
                    removeFromDeck()
                }
            }
    }
    
    private func removeFromDeck() {
        ticketDeck.remove(at: getIndex())
    }
    
    private func moveToBackOfDeck() {
        var newTicket = ticket
        newTicket.id = UUID().uuidString
        ticketDeck.remove(at: getIndex())
        withAnimation(.easeInOut(duration: 0.1)) {
            ticketDeck.append(newTicket)
        }
    }
    
    var body: some View {
        VStack {
            Ticket(ticket: ticket, height: height)
        }
        .zIndex(getZIndex())
        .offset(x: getIndex() == 0 ? dragValue : 0)
        .rotationEffect(getIndex() == 1 ? .degrees(-8) : .degrees(0))
        .rotationEffect(getIndex() == 2 ? .degrees(8) : .degrees(0))
        .rotationEffect(getIndex() == 0 ? getAngle() : .degrees(0))
        .scaleEffect(getIndex() == 0 ? 1.0 : 0.9)
        .offset(x: getIndex() == 1 ? -40 : 0)
        .offset(x: getIndex() == 2 ? 40 : 0)
        .gesture(dragGesture)

    }
    
    private func getZIndex() -> Double {
        let addition = dragValue > screenWidth/3 ? -1.1 : 0
        return -1.0 * Double(ticketDeck.firstIndex(where: {$0.id == ticket.id}) ?? 0) + addition
    }
    
    private func getIndex() -> Int {
        return ticketDeck.firstIndex(where: {$0.id == ticket.id}) ?? 0
    }
    
    private func getAngle() -> Angle {
        return Angle.degrees((dragValue / screenWidth) * 30.0)
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
}
