//
//  Product.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import Foundation


struct Product: Identifiable, Decodable {
    var id: String
    var title: String
    var description: String
    var price: Double
    var quantity: Int
    var imageUrl: String
    var user: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
        case price
        case quantity
        case imageUrl
        case user
    }
}
