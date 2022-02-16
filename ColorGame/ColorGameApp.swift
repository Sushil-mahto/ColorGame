//
//  ColorGameApp.swift
//  ColorGame
//
//  Created by SUshil on 16/02/22.
//

import SwiftUI

@main
struct ColorGameApp: App {
    @AppStorage("c1") var c1 = false
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.colorScheme, c1 ? .dark:.light)
        }
    }
}
