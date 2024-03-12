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

import SwiftUI

@main
struct shopyApp: App {
    @StateObject var productListViewModel = ProductListViewModel()
    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView()
                    .environmentObject(productListViewModel)
                    .environmentObject(cartManager)
            }
        }
    }
}
