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
    @State private var showingCheckout = false

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
                Spacer().frame(height: 40)
                
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
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(cartManager.cartItems) { cartItem in
                            HStack {
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
                            .background(Color(UIColor.systemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 2)
                        }
                        .onDelete(perform: removeItems)
                    }
                    .padding(.top)
                }
                .padding([.leading, .trailing, .bottom], 20)

                Button("Proceed to Checkout") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showingCheckout = true
                    }
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .offset(x: cartManager.isCartVisible ? 0 : UIScreen.main.bounds.width, y: 0)
            .animation(.easeInOut(duration: 0.3), value: showingCheckout)
            .edgesIgnoringSafeArea(.all)

            if showingCheckout {
                CheckoutView()
                    .transition(.move(edge: .trailing))
                    .frame(width: UIScreen.main.bounds.width) // Use full width
                    .background(Color.white)
                    .cornerRadius(0) // Optional: Adjust as needed for full-screen
                    .shadow(radius: 5)
                    .offset(x: showingCheckout ? 0 : UIScreen.main.bounds.width, y: 0)
                    .environmentObject(cartManager)
                    .zIndex(1) // Ensure CheckoutView layers above the CartView
                    .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showingCheckout)
    }
    
    func removeItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
