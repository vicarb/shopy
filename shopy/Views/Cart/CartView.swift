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
        ZStack(alignment: .topTrailing) {
            // Semi-transparent background that covers the whole screen
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    // This gesture handler will dismiss the cart when tapping outside the cart area
                    withAnimation(.easeInOut(duration: 0.3)) {
                        cartManager.isCartVisible = false
                    }
                }
            
            // Main cart content container
            VStack(alignment: .leading, spacing: 0) {
                // Spacer to push the content down a bit from the top
                Spacer().frame(height: 40) // Adjust the height here to move content down
                
                // "X" Close button within a horizontal stack
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            cartManager.isCartVisible = false // Toggles the cart visibility
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .padding(.leading, 20) // Left padding to avoid the edge
                    .padding(.top, 20) // Top padding to lower the button slightly from the top edge
                    
                    Spacer() // Pushes the button to the left
                }
                
                // ScrollView for cart items
                ScrollView {
                    VStack {
                        ForEach(cartManager.cartItems) { cartItem in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cartItem.product.title)
                                        .font(.headline)
                                    Text("Price: $\(cartItem.product.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Text("Qty: \(cartItem.quantity)")
                                    .font(.subheadline)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width) // Makes the cart content use the full width of the screen
            .background(Color.white) // Background color of the cart content
            .cornerRadius(20) // Rounds the corners of the cart content area
            .shadow(radius: 5) // Adds a shadow for visual depth
            .offset(x: cartManager.isCartVisible ? 0 : UIScreen.main.bounds.width, y: 0) // Controls the slide-in animation
            // Animation now applied directly to offset modifier
            .edgesIgnoringSafeArea(.all) // Ensures the cart content covers the entire screen, including the safe area
        }
        // Moving the animation modifier here to ensure it's consistently applied to the view
        .animation(.easeInOut(duration: 0.3), value: cartManager.isCartVisible)
    }
    
    func removeItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
