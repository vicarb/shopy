import SwiftUI

// CheckoutView
struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Checkout")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                customerInformationSection
                shippingAddressSection
                paymentMethodSection
            }
            .padding(.bottom, 100)
        }
        .padding(.horizontal)
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        
        // Bottom tab for the total amount
        totalAmountBottomTab
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
        .padding(.top)
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
        .padding(.top)
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
        .padding(.top)
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
                        .frame(height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
            .background(Color(UIColor.systemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -1)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}
