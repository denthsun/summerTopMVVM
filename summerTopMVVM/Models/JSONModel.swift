//
//  JSONModel.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 14.05.2021.
//

import Foundation

struct JSONModel: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let country: String
    let results: [Results]
}

struct Results: Decodable {
    let artistName: String
    let releaseDate: String
    let name: String
    let artworkUrl100: String
}
