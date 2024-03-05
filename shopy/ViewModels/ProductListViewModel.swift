//
//  ProductListViewModel.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import Foundation

import Combine

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []

    func fetchProducts() {
        guard let url = URL(string: "https://api-hander-atlas-bw6cnnbgua-tl.a.run.app/products") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, error == nil {
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self?.products = products
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else {
                print("Fetch error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
