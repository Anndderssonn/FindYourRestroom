//
//  RestroomModel.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

struct RestroomModel: Decodable {
    let id: Int
    let name: String?
    let street: String
    let city: String
    let state: String
    let accessible: Bool
    let unisex: Bool
    let distance: Double
    let comment: String?
    let latitude: Double
    let longitude: Double
    var address: String {
        "\(street), \(city) - \(state)"
    }
}
