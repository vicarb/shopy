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
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        cartManager.isCartVisible = false
                    }
                }
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: 40) // Keeps original top spacing
                
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            cartManager.isCartVisible = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                }
                
                ScrollView {
                    VStack(spacing: 15) { // Added spacing between cart items for better readability
                        ForEach(cartManager.cartItems) { cartItem in
                            HStack {
                                // Optional: Product image thumbnail
                                AsyncImage(url: URL(string: cartItem.product.imageUrl)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                }
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                                
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
                            .padding()
                            .background(Color(UIColor.systemBackground)) // Adds a subtle background to cart items
                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounds corners of the cart item background
                            .shadow(radius: 2) // Optional: Adds a slight shadow for depth
                        }
                        .onDelete(perform: removeItems)
                    }
                    .padding(.top) // Adds additional top padding inside the scroll view
                }
                .padding([.leading, .trailing, .bottom], 20) // Adjusts padding for the scroll view
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .offset(x: cartManager.isCartVisible ? 0 : UIScreen.main.bounds.width, y: 0)
            .animation(.easeInOut(duration: 0.3), value: cartManager.isCartVisible)
            .edgesIgnoringSafeArea(.all)
        }
        .animation(.easeInOut(duration: 0.3), value: cartManager.isCartVisible)
    }
    
    func removeItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
