//
//  WordDetailView.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 09/02/24.
//

import SwiftUI

struct WordDetailView: View {
    let word: String
    let audioURL: URL?
    let meaning: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text(word)
                .font(.custom("SF Pro Rounded", size: 45))
                .fontWeight(.bold)
            
            if let audioURL = audioURL {
                Button(action: {
                    
                }) {
                    Image("Sound")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .foregroundColor(Color("Button_Color"))
                }
            }
            
            Text(meaning)
                .font(.custom("SF Pro Rounded", size: 18))
                .opacity(0.5)
                .padding()
            
            Text("1) \(meaning)")
                .font(.custom("SF Pro Rounded", size: 18))
                .opacity(0.5)
                .padding()
           
            Text("That's it for \(word)!")
            
            Spacer()
            
            VStack {
                Text("Try another search now!")
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("NEW SEARCH")
                        .foregroundColor(.white)
                }
                .frame(width: 358, height: 64)
                .background(Color("Buttom_Color"))
                .cornerRadius(14)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    WordDetailView(word: "Example", audioURL: nil, meaning: "Example meaning")
}
