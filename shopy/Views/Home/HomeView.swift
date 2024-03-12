import Foundation
import SwiftUI

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ProductListViewModel

    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(viewModel.products, id: \.id) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCard(product: product)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color("backgroundColor")) // Ensure this color is defined in your assets
            .navigationTitle("Products")
            .onAppear {
                viewModel.fetchProductsIfNeeded()
            }
        }
    }
}
