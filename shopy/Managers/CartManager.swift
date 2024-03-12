//
//  CartManager.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 06-03-24.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cartItems: [Product] = []
    
    // Add a computed property to calculate the total quantity
    var totalQuantity: Int {
        cartItems.count // Adjust this calculation if your cart tracks quantities differently
    }

    func addToCart(product: Product) {
        cartItems.append(product)
    }
    var totalPrice: Double {
           cartItems.reduce(0) { $0 + $1.price }
       }

    // Your existing cart management functions...
}
