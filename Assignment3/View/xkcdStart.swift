//
//  xkcdStart.swift
//  Assignment3
//
//  Created by Juliana on 4/8/23.
//

import SwiftUI

struct xkcdStart: View {
    @State var first_amount: Int
    @State var second_amount: Int
    @State var random_value = Int.random(in: 1..<2700)
    @StateObject var favorites = xkcdFavorites()
    
    var body: some View {
        
        NavigationStack {
            Spacer(minLength: 25)
            Image("xkcd")
            List {
                NavigationLink(destination: xkcd(sorted : true, display_text: true, comic_range_low: first_amount, comic_range_high: second_amount)) {
                    HStack {
                        Text("See comics ")
                        TextField("1", value: $first_amount, format: .number)
                            .frame(width: 60)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        Text("through")
                        TextField("10", value: $second_amount, format: .number)
                            .frame(width: 60)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }}.onAppear(perform: {random_value = Int.random(in: 1..<2700)})
                NavigationLink(destination: xkcd(sorted : true, display_text: true, comic_range_low: random_value, comic_range_high: random_value)) {
                    HStack {
                        Text("See a random comic. ")
                    }
                }
                NavigationLink(destination: xkcdFavoriteView(sorted : true)) {
                    HStack {
                        Text("See favorite comics ")
                    
                    }}
                
            }.environmentObject(favorites)
        }.environmentObject(favorites) }
}

struct xkcdStart_Previews: PreviewProvider {
    static var previews: some View {
        xkcdStart(first_amount: 1, second_amount: 10)
    }
}
