import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ProductListViewModel()

    // Define the grid layout
    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)

    var body: some View {
        NavigationView { // Ensure NavigationView wraps your content
            ScrollView {
                // Header
                VStack {
                    Text("Discover Our Products")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.headerBackground)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top, 20)
                }

                // Grid
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCard(product: product)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.backgroundColor) // Use the light shade background color
           
            .onAppear {
                viewModel.fetchProducts()
            }
        } // Ensure the entire ScrollView is within the NavigationView
    }
}
