//
//  LoadingView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 08-03-24.
//

import Foundation
//
//  LoadingView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 08-03-24.
//

//
//  LoadingView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 08-03-24.
//

//
//  LoadingView.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 08-03-24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.appSecondaryColor.edgesIgnoringSafeArea(.all) // Set the background color to appSecondaryColor

            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .foregroundColor(.white) // Customize the color of the progress view
                
                Text("Loading...")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white) // Customize the color of the text
            }
            .padding(30)
        }
    }
}
