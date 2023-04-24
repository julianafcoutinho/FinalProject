//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct xkcd: View {
    
    @ObservedObject var xkcdComics = xkcdViewModel()
    @State var searchTem: String = ""
    @State var sorted : Bool
    @State var comic_range_low : Int
    @State var comic_range_high : Int
    
    var body: some View {

        NavigationStack {
            Spacer(minLength: 25)
            Image("xkcd")
            Text("The first " + String(comic_range_high))
                .font(.title3)
            HStack{
                Text("Sorting:")
                Toggle(isOn: $sorted) {
                    if(sorted) {
                        Text("Ascending") }
                    else {
                        Text("Descending")
                    }}}
            List {
                if(sorted){
                    ForEach(xkcdComics.xkcdData.sorted()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                    }
                }
            
            else {
                ForEach(xkcdComics.xkcdData.sorted().reversed()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                }
            }
            }
            
        } .onAppear {
            xkcdComics.fetchData(range: comic_range_low, comic_range_high)
        }
        
    }
} 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        xkcd(sorted: true, comic_range_low: 1, comic_range_high: 5)
    }
}
