import Foundation
import Foundation
import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    
    // Define state variables for user input
    @State private var fullName = ""
    @State private var email = ""
    @State private var shippingAddress = ""
    @State private var city = ""
    @State private var zipCode = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Checkout")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Group {
                    Text("Customer Information")
                        .font(.headline)
                    TextField("Full Name", text: $fullName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Email Address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                }
                
                Group {
                    Text("Shipping Address")
                        .font(.headline)
                    TextField("Address", text: $shippingAddress)
                        .textFieldStyle(.roundedBorder)
                    TextField("City", text: $city)
                        .textFieldStyle(.roundedBorder)
                    TextField("ZIP Code", text: $zipCode)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                
                Group {
                    Text("Payment Method")
                        .font(.headline)
                    Button(action: {
                        // Trigger third-party payment process for credit/debit card
                    }) {
                        Text("Pay with Credit/Debit Card")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, 2)
                    
                    Button(action: {
                        // Trigger third-party payment process for other payment options
                    }) {
                        Text("Other Payment Options")
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, 2)
                }
                
                Text("Total Amount: $\(cartManager.totalPrice, specifier: "%.2f")")
                    .font(.title)
                
                Button(action: {
                    // Final confirmation and process checkout
                    print("Finalizing checkout")
                }) {
                    Text("Confirm Order")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
    }
}
