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
            VStack {
                List {
                    ForEach(cartManager.cartItems) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.imageUrl)) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)

                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("$\(item.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }

                            Spacer()
                        }
                    }
                    .onDelete(perform: deleteItems)

                    // Display the total price
                    HStack {
                        Text("Total Price:")
                            .font(.headline)
                        Spacer()
                        Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                            .font(.headline)
                    }
                }
                
                // "Proceed to Checkout" button
                Button(action: {
                    print("Proceeding to checkout")
                    // Add your checkout logic here
                }) {
                    Text("Proceed to Checkout")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue) // Adjust this color as needed
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Cart")
            .toolbar {
                EditButton()
            }
            .listStyle(PlainListStyle())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
