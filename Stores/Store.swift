//
//  Store.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

typealias Dispatcher = (Action) -> Void
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState {}

struct AppState: ReduxState {
    var restrooms: RestroomState = RestroomState()
}

struct RestroomState: ReduxState {
    var restrooms: [RestroomModel] = []
}

class Store<StoreState: ReduxState>: ObservableObject {
    @Published var state: StoreState
    var reducer: Reducer<StoreState>
    var middlewares: [Middleware<StoreState>]
    
    init(state: StoreState,
         reducer: @escaping Reducer<StoreState>,
         middlewares: [Middleware<StoreState>] = []) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
