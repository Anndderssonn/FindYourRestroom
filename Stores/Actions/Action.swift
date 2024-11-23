//
//  Action.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

protocol Action {
    
}

struct FetchRestroomsAction: Action {
    let latitude: Double
    let longitude: Double
}

struct SetRestroomsAction: Action {
    let restrooms: [RestroomModel]
}
