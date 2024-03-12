import Foundation
import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Checkout")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Total Amount: $\(cartManager.totalPrice, specifier: "%.2f")")
                .font(.title)
            
            Spacer()
            
            Button(action: {
                // Implement your checkout logic here
                print("Checkout completed")
            }) {
                Text("Confirm Payment")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green) // Adjust this color as needed
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
