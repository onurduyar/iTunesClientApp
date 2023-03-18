//
//  EBookVC.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 18.03.2023.
//

import UIKit

final class EBookVC: UIViewController {
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var eBookResponse: EBookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "EBooks"
        view = mainView
        mainView.setCollectionViewDelegate(delegate: self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search for a book..."
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
        fetchEBooks()
    }
    // MARK: - Methods
    private func fetchEBooks(with text: String = "Ebooks") {
        networkService.request(EBookRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.eBookResponse = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate
extension EBookVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewVC = EBookDetailVC()
        detailViewVC.eBook = self.eBookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension EBookVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        eBookResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let ebook = eBookResponse?.results?[indexPath.row]
        cell.title = ebook?.bookName
        cell.imageView.downloadImage(from: ebook?.artworkLarge)
        return cell
    }
}
// MARK: - UISearchResultsUpdating
extension EBookVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchEBooks(with: text)
        }
    }
}
// MARK: - UISearchControllerDelegate
extension EBookVC: UISearchControllerDelegate{
    func didDismissSearchController(_ searchController: UISearchController) {
        fetchEBooks()
    }
}
