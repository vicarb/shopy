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
    @State private var navigationPath = NavigationPath()
    @Binding var isCheckingOut: Bool
    
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                List {
                    ForEach(cartManager.cartItems) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.imageUrl)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                         .aspectRatio(contentMode: .fill)
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
                
                Button("Proceed to Checkout") {
                    isCheckingOut = true
                    navigationPath.append(CartNavigationDestination.checkout)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer().frame(height: 50)
            }
            .navigationTitle("Cart")
            .toolbar {
                EditButton()
            }
            .navigationDestination(for: CartNavigationDestination.self) { destination in
                switch destination {
                case .checkout:
                    CheckoutView().environmentObject(cartManager)
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        cartManager.cartItems.remove(atOffsets: offsets)
    }
}
