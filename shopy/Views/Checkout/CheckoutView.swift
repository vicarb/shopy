//
//  CheckoutView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 06-03-24.
//

import Foundation
import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager

    @State private var shippingAddress: String = ""
    @State private var creditCardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""

    var body: some View {
        VStack {
            Text("Checkout")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50) // Adjust this value if needed to push the text further down from the notch
                .padding(.bottom, 20)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Order Summary:")
                            .font(.title2)
                            .bold()
                        
                        ForEach(cartManager.cartItems) { item in
                            HStack {
                                Text(item.product.title)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("x\(item.quantity)")
                            }
                        }
                        
                        HStack {
                            Text("Total:")
                                .fontWeight(.bold)
                            Spacer()
                            Text("$\(cartManager.total, specifier: "%.2f")")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Shipping Information:")
                            .font(.title2)
                            .bold()
                        TextField("Shipping Address", text: $shippingAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Payment Details:")
                            .font(.title2)
                            .bold()
                        TextField("Credit Card Number", text: $creditCardNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Expiry Date (MM/YY)", text: $expiryDate)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("CVV", text: $cvv)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.top)
                }
                .padding([.leading, .trailing])
            }
            .padding(.bottom, 20)

            Button(action: placeOrder) {
                Text("Place Order")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing])
            .padding(.bottom, 20) // Ensures "Place Order" is not too close to the bottom edge or home indicator
        }
        .edgesIgnoringSafeArea(.all) // Ensures the background extends behind the status bar, notch, and home indicator
    }

    private func placeOrder() {
        print("Order placed for \(cartManager.cartItems.count) items with a total cost of $\(cartManager.total)")
        // Implement the functionality to process the order here
    }
}
