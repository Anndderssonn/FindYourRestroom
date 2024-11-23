//
//  FindYourRestroomApp.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import SwiftUI

@main
struct FindYourRestroomApp: App {
    init () {
        configureTheme()
    }
    
    var body: some Scene {
        let store = Store(state: AppState(), reducer: appReducer)
        WindowGroup {
            HomeScreen().environmentObject(store)
        }
    }
    
    private func configureTheme () {
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 44/255,
                                                               green: 62/255,
                                                               blue: 80/255,
                                                               alpha: 1)
    }
}
