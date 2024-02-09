//
//  SubscriptionView.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        VStack {
            Text("Unlock Unlimited Searches")
                .font(.title)
                .padding()
            
            Text("Subscribe to get unlimited access to word searches, definitions, and audio pronunciations.")
                .padding()
            
            Button("Subscribe Now") {
                // Aqui você iniciaria o fluxo de compra com StoreKit
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    SubscriptionView()
}
