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

    init() {
        fetchProductsIfNeeded()
    }

    func fetchProductsIfNeeded() {
        // Early return if URL is incorrect to avoid unnecessary operations
        guard let url = URL(string: "https://api-hander-atlas-bw6cnnbgua-tl.a.run.app/products") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, error == nil {
                do {
                    let fetchedProducts = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        print("Fetched products: \(fetchedProducts)")
                        self?.products = fetchedProducts
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Decoding error: \(error)")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    print("Fetch error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }.resume()
    }
}
