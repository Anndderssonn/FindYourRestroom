//
//  Constants.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

struct Constants {
    struct Urls {
        static func restroomByLocation(lat: Double, lng: Double) -> String {
            "https://www.refugerestrooms.org/api/v1/restrooms/by_location?lat=\(lat)&lng=\(lng)"
        }
    }
}
