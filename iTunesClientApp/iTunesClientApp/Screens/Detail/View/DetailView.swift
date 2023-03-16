//
//  DetailView.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 16.03.2023.
//

import UIKit

class DetailView: UIView {
    // MARK: - Properties
    private(set) lazy var imageView = UIImageView()
    private lazy var releaseDateLabel = UILabel()
    private lazy var artistNameLabel = UILabel()
    private lazy var counrtyLabel = UILabel()
    private lazy var genresLabel = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupImageView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
    }
}
