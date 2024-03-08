//
//  shopyApp.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//
//  shopyApp.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isLoading: Bool = true
}

@main
struct shopyApp: App {
    @StateObject var appState = AppState()
    var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            Group {
                if appState.isLoading {
                    LoadingView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    appState.isLoading = false
                                }
                            }
                        }
                } else {
                    HomeView()
                        .environmentObject(cartManager)
                }
            }
            .onAppear {
                // Perform any additional setup or data loading here
                // This block will be executed before the view hierarchy is displayed
            }
        }
    }
}
