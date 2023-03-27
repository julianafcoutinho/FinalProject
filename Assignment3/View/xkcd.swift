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
            Spacer(minLength: 25)
            Image("xkcd")
            Text("The first 365")
                .font(.title3)
            List {
                
                ForEach(xkcdComics.xkcdData.sorted()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                }
            } 
            
        } .onAppear {
            xkcdComics.fetchData()
        }
        
    } 
} 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        xkcd()
    }
}
