//
//  ProductRow.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import Foundation
import SwiftUI

struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
            }

            Spacer()
        }
        .padding()
    }
}
