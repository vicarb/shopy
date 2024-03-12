import Foundation
import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Checkout")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Customer Information Section
                    customerInformationSection
                    // Shipping Address Section
                    shippingAddressSection
                    // Payment Method Section
                    paymentMethodSection
                }
                .padding(.bottom, 100) // Extra padding to ensure nothing is behind the bottom tab
            }
            .padding(.horizontal)
            .navigationBarTitle("Checkout", displayMode: .inline)

            // Bottom tab for the total amount
            totalAmountBottomTab
        }
        .background(Color(UIColor.systemBackground)) // Ensures the background extends to the bottom safe area
        .edgesIgnoringSafeArea(.bottom) // Allows the bottom tab to extend into the safe area
    }

    // MARK: - Customer Information Section
    var customerInformationSection: some View {
        Group {
            Text("Customer Information")
                .font(.headline)
            TextField("Full Name", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            TextField("Email Address", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
        }
    }

    // MARK: - Shipping Address Section
    var shippingAddressSection: some View {
        Group {
            Text("Shipping Address")
                .font(.headline)
            TextField("Address", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            TextField("City", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            TextField("ZIP Code", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
        }
    }

    // MARK: - Payment Method Section
    var paymentMethodSection: some View {
        Group {
            Text("Payment Method")
                .font(.headline)
            Button("Pay with Credit/Debit Card") {
                // Implementation for the credit/debit card payment
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical, 2)
            Button("Other Payment Options") {
                // Implementation for other payment options
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical, 2)
        }
    }

    // MARK: - Total Amount Bottom Tab
    var totalAmountBottomTab: some View {
        VStack(spacing: 10) {
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Total Amount:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }

                Spacer()

                Button(action: {
                    // Action to confirm payment
                }) {
                    Text("Confirm Payment")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 50) // Ensuring the button has a fixed height
                        .background(Color.accentColor) // Using accent color for the button
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
            .background(Color(UIColor.systemGroupedBackground)) // Grouped background for distinction
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous)) // Rounded corners
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -1) // Subtle top shadow
        }
        .edgesIgnoringSafeArea(.bottom) // Ensuring it extends to the bottom edge
    }

}
