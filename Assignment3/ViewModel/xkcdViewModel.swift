//
//  xkcdViewModel.swift
//  Assignment3
//
//  Created by Juliana on 3/23/23.
//

import Foundation

class xkcdViewModel : ObservableObject {
    
    @Published private(set) var xkcdData = [xkcdModel]()
   
    private let url1 = "https://xkcd.com/"
    private let url2 = "/info.0.json"
    
    @Published var searchTerm: String = ""
    
    init() {
    }
    
    func fetchData(first: Int, second: Int) {
        
        for i in first...second {
            if let url = URL(string: url1 + String(i) + url2) {
                URLSession
                    .shared
                    .dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print (error)
                        } else {
                            if let data = data {
                                do {
                                    let results = try JSONDecoder().decode(xkcdModel.self, from: data)
                                    if !self.xkcdData.contains(results) {
                                        self.xkcdData.append(results) }
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }.resume()
            }
        }
    }
}
