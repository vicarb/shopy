import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ProductListViewModel

    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCard(product: product)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color("backgroundColor")) // Ensure you have this color defined in your asset catalog
            .navigationTitle("Products")
            .onAppear {
                viewModel.fetchProductsIfNeeded()
            }
        }
    }
}
