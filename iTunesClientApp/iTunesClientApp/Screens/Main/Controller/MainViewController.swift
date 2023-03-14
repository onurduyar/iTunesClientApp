//
//  ViewController.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 10.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
}

/*
 private let networkService = BaseNetworkService()
 private var podcastResponse: PodcastResponse?
 
 func fetchPodcasts(with text: String = "Podcast") {
     networkService.request(PodcastRequest(searchText: text)) { result in
         switch result {
         case .success(let response):
             self.podcastResponse = response
             print(response)
         case .failure(let error):
             print(error.localizedDescription)
         }
     }
 }
 */
