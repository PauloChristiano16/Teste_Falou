//
//  PurchaseView.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import SwiftUI

struct PurchaseView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 20) {
            Image("Purchase_Image")
                .resizable()
                .scaledToFit()
            
            Image("Icon")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Subscribe now to get unlimited searches and full access to all features")
                .font(.custom("SF Pro Rounded", size: 20))
                .foregroundColor(Color("Font_General"))
                .multilineTextAlignment(.center)
                .padding()
                .overlay(
                    Text("unlimited")
                        .foregroundColor(Color("Button_Color"))
                    + Text(", all ")
                    + Text("features")
                        .foregroundColor(Color("Button_Color")),
                    alignment: .center
                )
            
            Text("Try 7 Days Free, Then only $19.99 per year. Cancel anytime")
                .font(.custom("SF Pro Rounded", size: 20))
                .foregroundColor(Color("Font_General"))
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("SUBSCRIBE")
                    .foregroundColor(.white)
            }
            .frame(width: 358, height: 64)
            .background(Color("Buttom_Color"))
            .cornerRadius(14)
            .padding()
        }
    }
}

#Preview {
    PurchaseView()
}
