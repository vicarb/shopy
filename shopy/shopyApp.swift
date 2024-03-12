//
//  shopyApp.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//
//  shopyApp.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import SwiftUI

@main
struct shopyApp: App {
    @StateObject var productListViewModel = ProductListViewModel()
    @StateObject var cartManager = CartManager()
    @State private var isCheckingOut = false // Add this state to track the checkout process

    var body: some Scene {
        WindowGroup {
            if isCheckingOut {
                CheckoutView() // The CheckoutView covers the entire screen, hiding the MainTabView
                    .environmentObject(productListViewModel)
                    .environmentObject(cartManager)
            } else {
                MainTabView(isCheckingOut: $isCheckingOut) // Pass the binding to MainTabView
                    .environmentObject(productListViewModel)
                    .environmentObject(cartManager)
            }
        }
    }
}
