import Foundation
import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager  // Access CartManager

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

                Button(action: {
                    // Action to add the product to the cart
                    cartManager.addToCart(product: product, selectedSize: nil, selectedColor: nil)
                }) {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal)
        }
        .background(Color.skyBlue)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(product.title), displayMode: .inline)
        .toolbar {
            // Add a ToolbarItem for the cart icon
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Toggle the cart visibility
                    cartManager.isCartVisible.toggle()
                }) {
                    Image(systemName: "cart")
                    Text("\(cartManager.cartItems.count)")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(cartManager.cartItems.isEmpty ? Color.clear : Color.red) // Conditionally show a red background if there are items in the cart
                        .clipShape(Circle())
                        .offset(x: -10, y: -10)
                }
            }
        }
    }
}
