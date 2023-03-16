//
//  PodcastCollectionViewCell.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 15.03.2023.
//

import UIKit

final class PodcastCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    private(set) lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
   // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupImageView()
        setupTitleLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}

