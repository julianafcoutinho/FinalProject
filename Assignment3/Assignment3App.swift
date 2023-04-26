//
// Assignment3App.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

@main
struct Assignment3App: App {
    var body: some Scene {
        WindowGroup {
            xkcdStart(first_amount: 1, second_amount: 10, random_value: Int.random(in: 1..<2700))
        }
    }
}
