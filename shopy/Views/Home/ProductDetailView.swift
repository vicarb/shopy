//
//  ProductDetailView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    var product: Product
    // Placeholder state variables for size and color selection
    @State private var selectedSize: String = "Select Size"
    @State private var selectedColor: String = "Select Color"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image display adjusted for a single image
                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                    switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .cornerRadius(10)
                        case .failure(_):
                            Color.gray.opacity(0.3) // Placeholder for a more graceful handling of loading/error states
                                .frame(height: 300)
                                .cornerRadius(10)
                        case .empty:
                            Color.gray.opacity(0.3) // Placeholder for loading state
                                .frame(height: 300)
                                .cornerRadius(10)
                        @unknown default:
                            EmptyView()
                    }
                }
                .padding(.top, 60)

                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text(product.description)
                        .foregroundColor(.white)
                        .padding(.top, 2)
                }
                .padding([.horizontal, .bottom])

                // "Add to Cart" Button
                Button(action: {
                    // Action to handle adding product to cart
                    print("Add to Cart tapped")
                }) {
                    Text("Add to Cart")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)

                // Future: Here you would include Picker for size and color
            }
            .padding(.horizontal)
        }
        .background(Color.skyBlue) // Assuming skyBlue is part of your vibrant color scheme
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(product.title), displayMode: .inline)
    }
}
