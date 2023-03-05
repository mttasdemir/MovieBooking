//
//  SeatsView.swift
//  MovieBooking
//
//  Created by Mustafa Taşdemir on 4.03.2023.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 25.0) {
            HStack {
                CircleButton(action: {
                    dismiss()
                })
                Spacer()
                Text("Choose Seats")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                CircleButton(action: {}, image: "calendar")
            }
            
            Image("frontSeat")
                .glow(color: Color("pink"), radius: 15)
            
            Image("seats")
                .padding(.top, 20)
            
            HStack(spacing: 20.0) {
                StatusUI()
                StatusUI(color: Color("majenta"), text: "Reserved")
                StatusUI(color: Color("cyan"), text: "Selected")
            }
            
            ZStack(alignment: .topLeading) {
                
                Circle()
                    .foregroundColor(Color("cyan"))
                    .frame(width: 200, height: 200)
                    .blur(radius: 70)
                    .offset(x: animate ? 0 : 150, y: animate ? 0 : 150)
                    .task {
                        withAnimation(.easeInOut(duration: 5).repeatForever()) {
                            animate.toggle()
                        }
                    }
                
                Circle()
                    .foregroundColor(Color("pink"))
                    .frame(width: 200, height: 200)
                    .blur(radius: 70)
                    .offset(x: animate ? 150: -90, y: animate ? -70 :100)
                    
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar")
                        Text("4th March, 2023")
                        Circle().frame(width: 6, height: 6)
                        Text("2 p.m.")
                    }
                    HStack {
                        Image(systemName: "ticket.fill")
                        Text("Seats 19, 20")
                        Circle().frame(width: 6, height: 6)
                        Text("VIP")
                    }
                    HStack {
                        Image(systemName: "cart.fill")
                        Text("Total: 12$")
                    }
                }
                
                HStack {
                    Spacer()
                    RoundButton {
                        NavigationUtil.popToRootView()
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .foregroundColor(.white)
            .font(.title3)
            .padding(.horizontal, 40)
            .padding(.top, 40)
            .background(.ultraThinMaterial)

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .navigationBarBackButtonHidden(true)
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView()
    }
}
