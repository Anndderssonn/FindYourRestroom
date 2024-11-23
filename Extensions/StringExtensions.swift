//
//  StringExtensions.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import Foundation

extension String {
    func encodeURL() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
