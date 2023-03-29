//
//  PodcastRequest.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 14.03.2023.
//

import Foundation

struct PodcastRequest: DataRequest {
    typealias Response = PodcastResponse
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var searchText: String
    
    init(searchText: String = "Podcast") {
        self.searchText = searchText
    }
    
    var queryItems: [String : String] {
        [
            "term" : searchText,
            "media": "podcast"
        ]
    }
    
    func decode(_ data: Data) throws -> PodcastResponse {
        try JSONDecoder().decode(Response.self, from: data)
    }
}
