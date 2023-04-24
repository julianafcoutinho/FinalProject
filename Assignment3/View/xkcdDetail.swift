//
//  xkcdDetail.swift
//  Assignment3
//
//  Created by Juliana on 3/23/23.
//

import SwiftUI
import AVFoundation

struct xkcdDetail: View {
    
    @State private var changeView = false
    let speech = AVSpeechSynthesizer()
    var xkcd : xkcdModel
    
    var body: some View {
        changeView ? AnyView(viewWithSubtitle) : AnyView(viewImageOnly)
    }
    
    
    var viewWithSubtitle: some View {
        ScrollView {
            VStack() {
                Text(xkcd.safe_title)
                AsyncImage(url: URL(string:xkcd.img)) {
                           image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("xkcd")
                }
                Text(xkcd.alt)
            }
            .onTapGesture{
                if let index = (xkcd.transcript.range(of: "Alt:")?.lowerBound) {
                    let spokenString = String(xkcd.transcript.prefix(upTo: index))
                    let utterance = AVSpeechUtterance(string: spokenString)
                    utterance.pitchMultiplier = 1.0
                    utterance.rate = 0.5
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    speech.speak(utterance)
                }
                
            }
        }
    }
    
    var viewImageOnly: some View {
        ScrollView {
            VStack() {
                Text(xkcd.safe_title)
                AsyncImage(url: URL(string:xkcd.img)) {
                           image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("xkcd")
                }
                .gesture(DragGesture(minimumDistance:  0)
                    .onChanged( { _ in changeView = true})
                    .onEnded({ _ in changeView = false})
                )
            }
        }
    }
    
    
    
    
}

//struct xkcdDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        xkcdDetail()
//    }
//}
