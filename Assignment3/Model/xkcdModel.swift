//
//  xkcdModel.swift
//  Assignment3
//
//  Created by Juliana on 3/23/23.
//

import Foundation

struct xkcdModel : Codable, Identifiable, Comparable, Hashable {
    static func < (lhs: xkcdModel, rhs: xkcdModel) -> Bool {
        return lhs.num < rhs.num
    }
    
    static func == (lhs: xkcdModel, rhs: xkcdModel) -> Bool {
        return lhs.num == rhs.num
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    

    
    let id = UUID()
    let month : String
    let num: Int
    let year: String
    let safe_title: String
    let transcript: String
    let alt: String
    let img: String
    

}
