//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct xkcd: View {
    @EnvironmentObject var favorites : xkcdFavorites
    @ObservedObject var xkcdComics = xkcdViewModel()
    @State var searchTem: String = ""
    @State var sorted : Bool
    @State var display_text : Bool
    var comic_range_low : Int
    var comic_range_high : Int
    
    var body: some View {

        VStack {
            Spacer(minLength: 25)
            Image("xkcd")
            Text(comic_range_low == comic_range_high ? "xkcd " + String(comic_range_low) : "xkcd " + String(comic_range_low) + " through " + String(comic_range_high))
                .font(.title3)
            if(comic_range_low != comic_range_high) {
                HStack{
                    Text("Sorting:")
                    Toggle(isOn: $sorted) {
                        if(sorted) {
                            Text("Ascending") }
                        else {
                            Text("Descending")
                        }}}
                HStack{
                    Text("Display:")
                    Toggle(isOn: $display_text) {
                        if(display_text) {
                            Text("Titles") }
                        else {
                            Text("Images")
                        }}}}
            NavigationStack {
                List {
                    if(sorted && display_text){
                        ForEach(xkcdComics.xkcdData.sorted()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                        }
                    }
                    else if(sorted) {
                        ForEach(xkcdComics.xkcdData.sorted()) { xkcd in NavigationLink(destination: xkcdDetail(xkcd: xkcd)) { AsyncImage(url: URL(string:xkcd.img)) { image in image.resizable()
                                .scaledToFit()
                        } placeholder: { ProgressView() }.frame() }
                        }
                    }
                    else if(display_text){
                        ForEach(xkcdComics.xkcdData.sorted().reversed()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                        }
                    }
                    else {
                        ForEach(xkcdComics.xkcdData.sorted().reversed()) { xkcd in NavigationLink(destination: xkcdDetail(xkcd: xkcd)) { AsyncImage(url: URL(string:xkcd.img)) { image in image.resizable()
                                .scaledToFit()
                        } placeholder: { ProgressView() }.frame() }
                        }
                    }
                }                                  }
        } .onAppear {
            xkcdComics.fetchData(first: comic_range_low, second: comic_range_high)
        }.environmentObject(favorites)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        xkcd(sorted: true, display_text: true, comic_range_low: 1, comic_range_high: 5)
    }
}
