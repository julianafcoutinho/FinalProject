//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct xkcd: View {
    
    @ObservedObject var xkcdComics = xkcdViewModel()
    
    var body: some View {
        NavigationStack {
            Text("Is this showing up?")
            
            List {
                Text("And this?")
                ForEach(xkcdComics.xkcdData) { xkcd in NavigationLink(xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                    Text("This?")
                    
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        xkcd()
    }
}
