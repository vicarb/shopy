//
//  shopyApp.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//
import SwiftUI

@main
struct shopyApp: App {
    var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(cartManager)
        }
    }
}
