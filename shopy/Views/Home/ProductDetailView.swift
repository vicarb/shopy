import Foundation
import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: product.imageUrl)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(height: 300)
                        .cornerRadius(10)
                }
                // Adjust top padding to ensure content doesn't start too close to the notch
                .padding(.top, 100)

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

                // Enhanced "Add to Cart" button
                Button(action: {
                    // Action to add the product to the cart
                    cartManager.addToCart(product: product, selectedSize: nil, selectedColor: nil)
                }) {
                    HStack {
                        Image(systemName: "cart.badge.plus")
                            .font(.title2)
                        Text("Add to Cart")
                            .fontWeight(.semibold)
                            .font(.title2)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.appSecondary)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.appPrimary, Color.appPrimary.opacity(1)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(radius: 5)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal)
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(product.title), displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                cartButton
            }
        }
    }

    private var cartButton: some View {
        Button(action: {
            withAnimation {
                cartManager.isCartVisible.toggle()
            }
        }) {
            Image(systemName: "cart")
            Text("\(cartManager.cartItems.count)")
                .foregroundColor(.white)
                .padding(5)
                .background(cartManager.cartItems.isEmpty ? Color.clear : Color.red)
                .clipShape(Circle())
                .offset(x: -10, y: -10)
        }
    }
}
