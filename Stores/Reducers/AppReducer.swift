//
//  AppReducer.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.restrooms = restroomsReducer(state.restrooms, action)
    return state
}
