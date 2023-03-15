//
//  PodcastResponse.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 14.03.2023.
//

import Foundation

struct PodcastResponse: Decodable {
    let resultCount: Int?
    let results: [Podcast]?
}
