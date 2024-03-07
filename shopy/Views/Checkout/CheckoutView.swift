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

    // Placeholder state variables for checkout details
    @State private var shippingAddress = ""
    @State private var creditCardNumber = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    @State private var showingConfirmationDialog = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Checkout")
                    .font(.largeTitle)
                    .padding(.bottom)

                orderSummary

                // Shipping Information
                VStack(alignment: .leading, spacing: 10) {
                    Text("Shipping Information:")
                        .font(.title2)
                        .bold()
                    TextField("Shipping Address", text: $shippingAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Payment Details
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

                Spacer()

                Button("Place Order") {
                    showingConfirmationDialog = true
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding()
        }
        .alert(isPresented: $showingConfirmationDialog) {
            Alert(
                title: Text("Confirm Order"),
                message: Text("Do you want to place your order?"),
                primaryButton: .destructive(Text("Confirm")) {
                    placeOrder()
                },
                secondaryButton: .cancel()
            )
        }
    }

    private var orderSummary: some View {
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
    }

    private func placeOrder() {
        // Placeholder for order processing logic
        print("Processing order for \(cartManager.cartItems.count) items with total: $\(cartManager.total)")
        // Integrate with your backend or payment processor here
    }
}
