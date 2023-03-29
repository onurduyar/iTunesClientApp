//
//  Podcast.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 14.03.2023.
//

import Foundation

struct Podcast: Decodable,Equatable {
    static var favorites: [Podcast] = []
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    let genres: [String]?
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkLarge = "artworkUrl600"
        case releaseDate
        case country
        case genres
    }
}
