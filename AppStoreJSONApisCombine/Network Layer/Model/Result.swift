//
//  Result.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl512: String
    let screenshotUrls: [String]
}
