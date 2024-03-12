//
//  CartView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 06-03-24.
//

import Foundation
import SwiftUI

enum CartNavigationDestination {
    case checkout
}




// CartView
struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        List {
            ForEach(cartManager.cartItems, id: \.id) { item in
                HStack {
                    AsyncImage(url: URL(string: item.imageUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().aspectRatio(contentMode: .fill)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
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
            
            HStack {
                Text("Total Price:")
                    .font(.headline)
                Spacer()
                Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                    .font(.headline)
            }
        }
        .navigationTitle("Cart")
        .overlay(
            VStack {
                Spacer()
                NavigationLink(destination: CheckoutView().environmentObject(cartManager)) {
                    Text("Proceed to Checkout")
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                }
                .buttonStyle(PlainButtonStyle()) // To remove any default styling
            }
        )
    }
    
    func deleteItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
