//
//  RestroomsMiddleware.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

func restroomsMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case let action as FetchRestroomsAction:
            getRestroomsByLocation(action: action, dispatch: dispatch)
        default:
            break
        }
    }
}

private func getRestroomsByLocation(action: FetchRestroomsAction, dispatch: @escaping Dispatcher) {
    WebService().getRestroomsByLocation(lat: action.latitude, lng: action.longitude) { result in
        switch result {
        case .success(let restrooms):
            if let restrooms = restrooms {
                dispatch(SetRestroomsAction(restrooms: restrooms))
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
