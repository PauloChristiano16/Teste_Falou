//
//  ContentView.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DictionaryViewModel()
    @State private var searchText: String = ""
    @State private var isSearchButtonVisible: Bool = false
    @State private var isShowingWordDetail = false
    @State private var searchCount: Int = 0
    @State private var isShowingPurchaseView = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Rectangle()
                    .foregroundColor(Color("Rectangle"))
                    .frame(width: 160, height: 40)
                    .cornerRadius(20)
                    .overlay(
                        HStack {
                            Image("English")
                            Text("ENGLISH")
                                .font(.custom("SF Pro Rounded", size: 18))
                                .kerning(1.8)
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    )
                
                Spacer()
                    .frame(height: 75)
                
                // Search field
                TextField("Type a word...", text: $searchText)
                    .font(.custom("SF Pro Rounded", size: 32))
                    .foregroundColor(Color("Font_Search"))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        isSearchButtonVisible = true
                    }
                
                // Search button
                if isSearchButtonVisible {
                    Button(action: {
                        viewModel.searchWord(searchText)
                        isShowingWordDetail = true
                        
                        // Incrementa o contador de pesquisas
                        searchCount += 1
                        
                        // Verifica se o número de pesquisas atingiu 5
                        if searchCount == 5 {
                            isShowingPurchaseView = true
                        }
                    }) {
                        Text("Search")
                            .foregroundColor(.white)
                    }
                    .frame(width: 358, height: 64)
                    .background(Color("Buttom_Color"))
                    .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("")
            .sheet(isPresented: $isShowingWordDetail) {
                if let wordDetails = viewModel.wordDetails {
                    WordDetailView(word: wordDetails.word, audioURL: wordDetails.audioURL, meaning: wordDetails.meaning)
                } else {
                    ProgressView()
                }
            }
            .sheet(isPresented: $isShowingPurchaseView) {
                PurchaseView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
