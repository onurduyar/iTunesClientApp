//
//  ViewController.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 10.03.2023.
//

import UIKit

final class PodcastVC: UIViewController {
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcasts"
        navigationController?.navigationBar.tintColor = .red
        view = mainView
        mainView.setCollectionViewDelegate(delegate: self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Education, Fun..."
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
        fetchPodcasts()
        }
    // MARK: - Methods
    private func fetchPodcasts(with text: String = "Podcasts") {
        networkService.request(PodcastRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.podcastResponse = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate
extension PodcastVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewVC = PodcastDetailVC()
        detailViewVC.podcast = self.podcastResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension PodcastVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        podcastResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        cell.imageView.downloadImage(from: podcast?.artworkLarge)
        return cell
    }
}
// MARK: - UISearchResultsUpdating
extension PodcastVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchPodcasts(with: text)
        }
    }
}
// MARK: - UISearchControllerDelegate
extension PodcastVC: UISearchControllerDelegate{
    func didDismissSearchController(_ searchController: UISearchController) {
        fetchPodcasts()
    }
}
