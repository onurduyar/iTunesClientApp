//
//  FavoriteVC.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 19.03.2023.
//

import UIKit
import CoreData

final class FavoriteVC: UIViewController {
    private let mainView = MainView()
    private var mediaIDs = [UUID]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(delegate: self, andDataSource: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        mainView.refresh()
        print(Podcast.favorites)
    }
}
extension FavoriteVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Podcast.favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let podcast = Podcast.favorites[indexPath.row]
        cell.title = podcast.trackName
        cell.imageView.downloadImage(from: podcast.artworkLarge)
        return cell
    }
    
}
