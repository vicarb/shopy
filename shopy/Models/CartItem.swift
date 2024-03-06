//
//  CartItem.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 06-03-24.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    let id = UUID()
    var product: Product
    var quantity: Int
    var selectedSize: String? // Optional, depending on your product model
    var selectedColor: String? // Optional, depending on your product model
    
    // Equatable conformance to identify if two cart items are the same
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        lhs.id == rhs.id
    }
}
