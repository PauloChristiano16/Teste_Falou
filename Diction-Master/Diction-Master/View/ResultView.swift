//
//  ResultView.swift
//  Diction-Master
//
//  Created by Paulo Christiano on 08/02/24.
//

import SwiftUI
import AVFoundation

struct ResultView: View {
    var wordDefinition: WordDefinition
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let phonetic = wordDefinition.phonetic {
                    Text("Pronunciation: \(phonetic)")
                        .padding(.bottom)
                }
                
                ForEach(wordDefinition.meanings, id: \.self) { meaning in
                    Text(meaning.partOfSpeech.uppercased())
                        .fontWeight(.bold)
                    
                    ForEach(meaning.definitions, id: \.self) { definition in
                        Text(definition.definition)
                        if let example = definition.example {
                            Text("Example: \(example)")
                                .italic()
                        }
                    }
                    .padding(.bottom)
                }
                
                if let audioURL = URL(string: "https:\(wordDefinition.phonetics.first?.audio ?? "")") {
                    Button("Play Audio") {
                        playAudio(from: audioURL)
                    }
                }
            }
            .padding()
        }
    }
}

func playAudio(from url: URL) {
    var player: AVPlayer?
    let playerItem = AVPlayerItem(url: url)
    player = AVPlayer(playerItem: playerItem)
    player?.play()
}

#Preview {
    ResultView()
}
