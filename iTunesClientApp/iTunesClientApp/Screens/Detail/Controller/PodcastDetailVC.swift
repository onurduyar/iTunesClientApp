//
//  DetailViewController.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 16.03.2023.
//

import UIKit
import CoreData

class PodcastDetailVC: UIViewController {
    var podcast: Podcast?{
        didSet{
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            title = podcast?.trackName
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.counrty = podcast?.country
            isFavorited = podcast?.isFavorite ?? false
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
        if Podcast.favorites.contains(podcast!){
            isFavorited = true
            favItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(favoriteButtonTapped))
        }else {
            favItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteButtonTapped))
        }
        navigationItem.rightBarButtonItem = favItem
    }
    @objc func favoriteButtonTapped() {
        isFavorited.toggle()
        podcast?.isFavorite = isFavorited
        guard let podcast else {return}
        if isFavorited{
            favItem.image = UIImage(systemName: "heart.fill")
            Podcast.favorites.append(podcast)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)!
            let item = NSManagedObject(entity: entity, insertInto: managedContext)
            item.setValue(podcast.trackName, forKey: "mediaName")
            item.setValue(podcast.artworkLarge?.absoluteString, forKey: "artwork")
            item.setValue(podcast.isFavorite, forKey: "isFavorited")
            do {
                try managedContext.save()
            } catch {
                print(error.localizedDescription)
            }
        } else{
            favItem.image = UIImage(systemName: "heart")
            guard let index = Podcast.favorites.firstIndex(where: {$0 == podcast}) else { return }
            Podcast.favorites.remove(at: index)
            
        }
    }
}

