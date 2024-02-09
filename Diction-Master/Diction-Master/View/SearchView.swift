//
//  SearchView.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import SwiftUI
// View da Barra de Busca
struct SearchBarView: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    
    var body: some View {
        TextField("Type a word...", text: $searchText)
            // ... estilização do TextField ...
    }
}

// View do Botão de Busca
struct SearchButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button("SEARCH", action: action)
            // ... estilização do Button ...
    }
}

// Tela de Busca Principal
struct SearchView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel: DictionaryViewModel
    
    var body: some View {
        VStack {
            // ... Header com retângulo, imagem e texto ...
            
            Spacer()
            
            // Barra de Busca
            SearchBarView(searchText: $searchText, onSearch: {
                viewModel.searchWord(searchText)
            })
            
            // Botão de Busca
            if !searchText.isEmpty {
                SearchButtonView {
                    viewModel.searchWord(searchText)
                }
                .animation(.default, value: searchText.isEmpty)
                .transition(.move(edge: .bottom))
            }
            
            Spacer()
        }
        .padding()
        .onChange(of: searchText) { newValue in
            if newValue.isEmpty {
                viewModel.wordDefinitions = []
            }
        }
        // Lógica para lidar com o teclado e animações
        // ...
    }
}


#Preview {
    SearchView()
}
