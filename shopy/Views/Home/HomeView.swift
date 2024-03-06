import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ProductListViewModel()
    @EnvironmentObject var cartManager: CartManager

    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)

    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
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

                    LazyVGrid(columns: gridLayout, spacing: 20) {
                        ForEach(viewModel.products) { product in
                            NavigationLink(destination: ProductDetailView(product: product).environmentObject(cartManager)) {
                                ProductCard(product: product)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color.backgroundColor)
                .navigationBarItems(trailing: Button(action: {
                    withAnimation {
                        cartManager.isCartVisible.toggle()
                    }
                }) {
                    Image(systemName: "cart")
                    Text("\(cartManager.cartItems.count)")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: -10, y: -10)
                })
                .onAppear {
                    viewModel.fetchProducts()
                }
            }

            // Conditional presentation of the CartView as a side panel
            if cartManager.isCartVisible {
                CartView()
                    .environmentObject(cartManager)
                    .frame(width: UIScreen.main.bounds.width * 0.75)
                    .offset(x: cartManager.isCartVisible ? 0 : UIScreen.main.bounds.width, y: 0)
                    .animation(.easeInOut(duration: 0.5), value: cartManager.isCartVisible)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
