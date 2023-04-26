//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct xkcdFavoriteView: View {
    @EnvironmentObject var favorites : xkcdFavorites
    @State var sorted : Bool

    var body: some View {
        NavigationStack {
            Spacer(minLength: 25)
            Image("xkcd")
            Text("Favorite Comics")
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
                    ForEach(favorites.xkcdfavorites.sorted()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                    }
                }
                else {
                    ForEach(favorites.xkcdfavorites.sorted().reversed()) { xkcd in NavigationLink(String(xkcd.num) + " - " + xkcd.safe_title) { xkcdDetail(xkcd: xkcd) }
                    }
                }
            }
        }.environmentObject(favorites)
        .onAppear{favorites.fetchdata()}
    }
}

struct xkcdFavorites_Previews: PreviewProvider {
    static var previews: some View {
        xkcdFavoriteView(sorted: true)
    }
}
