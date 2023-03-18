//
//  EBookDetailVC.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 18.03.2023.
//

import UIKit

class EBookDetailVC: UIViewController {
    var eBook: EBook?{
        didSet{
            detailView.imageView.downloadImage(from: eBook?.artworkLarge)
            title = eBook?.bookName
            detailView.releaseDate = eBook?.releaseDate
            detailView.artistName = eBook?.authorName
            detailView.genres = eBook?.genres?.reduce("") {$0 + $1 + ", "}
        }
    }
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
    
}
