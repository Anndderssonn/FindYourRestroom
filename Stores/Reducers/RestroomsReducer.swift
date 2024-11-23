//
//  RestroomsReducer.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

func restroomsReducer(_ state: RestroomState, _ action: Action) -> RestroomState {
    var state = state
    switch action {
    case let action as SetRestroomsAction:
        state.restrooms = action.restrooms
    default:
        break
    }
    return state
}
