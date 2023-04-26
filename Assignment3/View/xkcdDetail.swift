//
//  xkcdDetail.swift
//  Assignment3
//
//  Created by Juliana on 3/23/23.
//

import SwiftUI
import AVFoundation

struct xkcdDetail: View {
    @EnvironmentObject var favorites : xkcdFavorites
    @State private var changeView = false
    @State private var alt_text = false
    let speech = AVSpeechSynthesizer()
    var xkcd : xkcdModel
    
    var body: some View {
        ScrollView {
            VStack() {
                Text(xkcd.safe_title)
                AsyncImage(url: URL(string:xkcd.img)) {
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("xkcd")
                }.onTapGesture{
                                    alt_text = !alt_text
                                    if let index = (xkcd.transcript.range(of: "Alt:")?.lowerBound) {
                                    let spokenString = String(xkcd.transcript.prefix(upTo: index))
                                    let utterance = AVSpeechUtterance(string: spokenString)
                                    utterance.pitchMultiplier = 1.0
                                    utterance.rate = 0.5
                                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                                    speech.speak(utterance)
                                    
                                }}
                if(alt_text){
                    HStack{
                        Text(xkcd.alt.uppercased()).multilineTextAlignment(.center)
                        }}
            }
            
            VStack(alignment: .trailing) {
                Button {
                    if favorites.contains(xkcd) {
                        favorites.remove(xkcd) }
                    else {
                        favorites.add(xkcd) }
                }label: {favorites.contains(xkcd) ? Image(systemName: "heart.fill").font(.title2) : Image(systemName: "heart").font(.title2)}
                
            }
            
        }
    }
    
}

//struct xkcdDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        xkcdDetail()
//    }
//}
