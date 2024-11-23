//
//  ViewExtenesions.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
