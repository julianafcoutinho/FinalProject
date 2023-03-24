//
//  xkcdDetail.swift
//  Assignment3
//
//  Created by Juliana on 3/23/23.
//

import SwiftUI

struct xkcdDetail: View {
    
    
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
                }
            }
        }
    }
    
    
    
    
    
}

//struct xkcdDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        xkcdDetail()
//    }
//}
