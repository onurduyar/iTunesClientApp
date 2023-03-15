//
//  ViewController.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 10.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    
    private let mainView = MainView()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(delegate: self, andDataSource: self)
    }
    
    // MARK: - Methods
    
    


}
// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
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
