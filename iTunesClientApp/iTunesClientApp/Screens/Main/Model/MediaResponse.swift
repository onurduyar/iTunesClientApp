//
//  MediaResponse.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 18.03.2023.
//

import Foundation

struct PodcastResponse: Decodable {
    let resultCount: Int?
    let results: [Podcast]?
}
struct EBookResponse: Decodable {
    let resultCount: Int?
    let results: [EBook]?
}
