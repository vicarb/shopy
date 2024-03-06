import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ProductListViewModel()
    @EnvironmentObject var cartManager: CartManager // Access the CartManager

    // Define the grid layout
    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)

    var body: some View {
        NavigationView {
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
                        NavigationLink(destination: ProductDetailView(product: product).environmentObject(cartManager)) {
                            ProductCard(product: product)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.backgroundColor) // Use the light shade background color
            
            .navigationBarItems(trailing: Button(action: {
                cartManager.isCartVisible.toggle() // Toggle the global cart visibility state
            }) {
                // Display a cart icon with a badge showing the number of items
                Image(systemName: "cart")
                Text("\(cartManager.cartItems.count)")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: -10, y: -10) // Adjust as necessary
            })
            .sheet(isPresented: $cartManager.isCartVisible) { // Use the global state for showing the cart
                CartView().environmentObject(cartManager)
            }
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}
