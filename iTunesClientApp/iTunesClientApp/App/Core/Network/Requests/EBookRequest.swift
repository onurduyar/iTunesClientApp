//
//  EBookRequest.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 18.03.2023.
//

import Foundation

struct EBookRequest: DataRequest {
    typealias Response = EBookResponse
    
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
    
    init(searchText: String = "EBooks") {
        self.searchText = searchText
    }
    
    var queryItems: [String : String] {
        [
            "term" : searchText,
            "media": "ebook"
        ]
    }
    
    func decode(_ data: Data) throws -> EBookResponse {
        try JSONDecoder().decode(Response.self, from: data)
    }
}
