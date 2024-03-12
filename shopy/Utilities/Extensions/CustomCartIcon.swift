//
//  CustomCartIcon.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 11-03-24.
//

import Foundation
import SwiftUI

struct CustomCartIcon: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .foregroundColor(.black) // Customize the cart icon color
            
            if cartManager.totalQuantity > 0 {
                Text("\(cartManager.totalQuantity)")
                    .font(.caption2).bold()
                    .foregroundColor(.white) // Badge text color
                    .padding(5)
                    .background(Color.black) // Badge background color
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
    }
}
