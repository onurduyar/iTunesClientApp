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
            configureFavItem()
        }
    }
    private let detailView = DetailView()
    private var favItem = UIBarButtonItem()
    private var isFavorited: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
    func configureFavItem() {
        if Podcast.favorites.contains(podcast!) {
            isFavorited = true
            favItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(favoriteButtonTapped))
        }else {
            favItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteButtonTapped))
        }
        navigationItem.rightBarButtonItem = favItem
    }
    @objc func favoriteButtonTapped() {
        isFavorited.toggle()
        guard let podcast else {return}
        if isFavorited{
            favItem.image = UIImage(systemName: "heart.fill")
            Podcast.favorites.append(podcast)
            
        } else{
            favItem.image = UIImage(systemName: "heart")
            guard let index = Podcast.favorites.firstIndex(where: {$0 == podcast}) else { return }
            Podcast.favorites.remove(at: index)
            
        }
        print(Podcast.favorites)
    }
}

