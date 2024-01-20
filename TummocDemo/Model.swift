//
//  Model.swift
//  TummocDemo
//
//  Created by avinash on 20/01/24.
//

import Foundation

// MARK: - Temperatures
struct Temperatures: Codable {
    let status: Bool
    let message: String
    let error: JSONNull?
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let name: String
    let icon: String
    let price: Double
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
