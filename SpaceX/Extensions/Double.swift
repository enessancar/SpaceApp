//
//  Double.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import Foundation

extension Double {
    func unixToDate() -> Date {
        Date(timeIntervalSince1970: self)
    }
}
