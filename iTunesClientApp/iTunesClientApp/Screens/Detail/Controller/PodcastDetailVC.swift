//
//  DetailViewController.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 16.03.2023.
//

import UIKit

class PodcastDetailVC: UIViewController {
    var podcast: Podcast?{
        didSet{
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            title = podcast?.trackName
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.counrty = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") {$0 + $1 + ", "}
        }
    }
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
    
}
