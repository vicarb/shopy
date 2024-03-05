//
//  ProductCard.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    var product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Image
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(10)
            
            // Title with increased font weight
            Text(product.title)
                .font(.headline.weight(.semibold)) // Increase font weight here
                .foregroundColor(.textColor)
                .lineLimit(1)

            // Price with increased font weight
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline.weight(.semibold)) // Increase font weight here
                .foregroundColor(.appPrimaryColor)
        }
        .padding()
        .frame(width: 170, height: 250)
        .background(Color.appSecondaryColor)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
