//
//  MainTabView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 11-03-24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @Binding var isCheckingOut: Bool // Add a Binding to track the checkout state
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }

            CartView(isCheckingOut: $isCheckingOut) // Pass the binding to CartView
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
                .badge(cartManager.totalQuantity)
        }
    }
}
