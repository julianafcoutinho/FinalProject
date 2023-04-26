//
//  xkcdFavorites.swift
//  Assignment3
//
//  Created by Juliana on 4/23/23.
//

import Foundation
import SwiftUI

class xkcdFavorites : ObservableObject {
    
    @Published private(set) var xkcdfavorites = [xkcdModel]()
    private let saveKey = "Favorites"
    
    init() {
        xkcdfavorites = []
    }
    
    func contains(_ xkcdItem: xkcdModel) -> Bool {
        xkcdfavorites.contains(xkcdItem)
    }
    
    func add(_ xkcdItem: xkcdModel) {
        objectWillChange.send()
        xkcdfavorites.append(xkcdItem)
        save()
    }
    
    func save() {
        
    }
    
    func remove(_ xkcdItem: xkcdModel) {
        if let index = xkcdfavorites.firstIndex(of: xkcdItem) {
            xkcdfavorites.remove(at: index) }
        
    }
    
    func fetchdata() {
        
    }
}
