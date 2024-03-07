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
        ZStack(alignment: Alignment.topTrailing) {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(Edge.Set.all)
                .onTapGesture {
                    withAnimation(Animation.easeInOut(duration: 0.3)) {
                        cartManager.isCartVisible = false
                    }
                }
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 0) {
                Spacer().frame(height: 40)
                
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.3)) {
                        cartManager.isCartVisible = false
                    }
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.white)
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
                                
                                VStack(alignment: HorizontalAlignment.leading) {
                                    Text(cartItem.product.title)
                                        .font(Font.headline)
                                    Text("Price: $\(cartItem.product.price, specifier: "%.2f")")
                                        .font(Font.subheadline)
                                }
                                
                                Spacer()
                                
                                Text("Qty: \(cartItem.quantity)")
                                    .font(Font.subheadline)
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
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))

                Button("Proceed to Checkout") {
                    showingCheckout = true
                }
                .foregroundColor(Color.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20)) // Increased bottom padding to raise the button
                .sheet(isPresented: $showingCheckout) {
                    // Ensure CheckoutView is correctly implemented
                    CheckoutView()
                }
                
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .offset(x: cartManager.isCartVisible ? 0 : UIScreen.main.bounds.width, y: 0)
            .animation(Animation.easeInOut(duration: 0.3), value: cartManager.isCartVisible)
            .edgesIgnoringSafeArea(Edge.Set.all)
        }
        .animation(Animation.easeInOut(duration: 0.3), value: cartManager.isCartVisible)
    }

    func removeItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
