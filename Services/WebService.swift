//
//  WebService.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

class WebService {
    
    func getRestroomsByLocation(lat: Double, lng: Double,
                                completion: @escaping (Result<[RestroomModel]?, NetworkError>)
                                -> Void) {
        guard let resourceURL = URL(string: Constants.Urls.restroomByLocation(lat: lat, lng: lng))
        else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let restrooms = try? JSONDecoder().decode([RestroomModel].self, from: data)
            completion(.success(restrooms))
        }.resume()
    }
}
