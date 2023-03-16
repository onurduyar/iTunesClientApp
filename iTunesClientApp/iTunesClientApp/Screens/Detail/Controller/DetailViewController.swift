//
//  DetailViewController.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 16.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
   
    
    var podcast: Podcast?{
        didSet{
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            title = podcast?.trackName
        }
    }
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
    
}
