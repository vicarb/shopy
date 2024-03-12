//
//  MainTabView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 11-03-24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var cartManager: CartManager // Ensure cartManager is injected at the top level of your app

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Products", systemImage: "list.bullet")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
                .badge(cartManager.totalQuantity) // This shows a badge with the total quantity
        }
    }
}
