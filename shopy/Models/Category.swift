//
//  Category.swift
//  shopy
//
//  Created by Victor Cardenas Bahamonde on 04-03-24.
//

import Foundation

struct Category: Identifiable, Decodable {
    var id: String
    var name: String
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageUrl
    }
}
