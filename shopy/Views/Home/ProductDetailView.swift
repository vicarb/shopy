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

                // Add to Cart Button
                Button(action: {
                    addToCart()
                }) {
                    Text("Add to Cart")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.appPrimary, Color.appSecondary]), startPoint: .leading, endPoint: .trailing))
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
    }

    private func addToCart() {
        cartManager.addToCart(product: product)
        print("Product added to cart: \(product.title)")
    }

    private func isProductInCart() -> Bool {
        cartManager.cartItems.contains(where: { $0.id == product.id })
    }
}
