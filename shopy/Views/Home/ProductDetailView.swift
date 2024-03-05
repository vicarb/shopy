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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Color.gray.opacity(0.3) // Placeholder for a more graceful handling of loading/error states
                            .frame(height: 300)
                            .cornerRadius(10)
                    } else {
                        Color.gray.opacity(0.3) // Placeholder for loading state
                            .frame(height: 300)
                            .cornerRadius(10)
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
            }
            .padding(.horizontal)
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(product.title), displayMode: .inline)
    }
}
