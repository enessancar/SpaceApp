//
//  APIURLs.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import Foundation

enum APIURLs {
    private static let baseURL = "https://api.spacexdata.com/v4"
    
    static let upcomingLaunches = "\(baseURL)/launches/upcoming"
    static let pastLaunches = "\(baseURL)/launches/past"
    
    static func launchDetail(id: String) -> String {
        "\(baseURL)/launches/\(id)"
    }
}

