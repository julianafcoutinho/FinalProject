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
    
    var body: some View {
        
        NavigationStack {
            Spacer(minLength: 25)
            Image("xkcd")
            List {
                NavigationLink(destination: xkcd(sorted : true, comic_range_low: first_amount, comic_range_high: second_amount)) {
                    HStack {
                        Text("See comic ")
                        TextField("1", value: $first_amount, format: .number)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        Text("through")
                        TextField("10", value: $second_amount, format: .number)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }}
                Text("See your favorites")
                
            }
        }}
}

struct xkcdStart_Previews: PreviewProvider {
    static var previews: some View {
        xkcdStart(first_amount: 1, second_amount: 10)
    }
}
