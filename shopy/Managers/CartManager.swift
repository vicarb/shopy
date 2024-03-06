//
//  CartManager.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 06-03-24.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    @Published var isCartVisible: Bool = false
    
    func addToCart(product: Product, selectedSize: String? = nil, selectedColor: String? = nil) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id && $0.selectedSize == selectedSize && $0.selectedColor == selectedColor }) {
            cartItems[index].quantity += 1
        } else {
            let newItem = CartItem(product: product, quantity: 1, selectedSize: selectedSize, selectedColor: selectedColor)
            cartItems.append(newItem)
        }
    }
    
    func removeFromCart(cartItem: CartItem) {
        cartItems = cartItems.filter { $0.id != cartItem.id }
    }
    
    func updateQuantity(for cartItem: CartItem, newQuantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            cartItems[index].quantity = newQuantity
        }
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
    
    var total: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}
