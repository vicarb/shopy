//
//  CartView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 06-03-24.
//

import Foundation
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            List {
                ForEach(cartManager.cartItems) { cartItem in
                    HStack {
                        Text(cartItem.product.title)
                        Spacer()
                        Text("Quantity: \(cartItem.quantity)")
                        Text("Price: $ \(cartItem.product.price)")
                    }
                    // Here you can add more details or controls for each cart item
                }
                .onDelete(perform: removeItems)  // Enables swipe to delete functionality
            }
            .navigationTitle("Shopping Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        // Add action to dismiss the view
                        cartManager.isCartVisible = false
                    }
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
