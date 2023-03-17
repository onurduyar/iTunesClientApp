//
//  DetailView.swift
//  iTunesClientApp
//
//  Created by Onur Duyar on 16.03.2023.
//

import UIKit

class DetailView: UIView {
    // MARK: - Properties
    var releaseDate: String? {
        didSet{
            releaseDateLabel.text = "Release Date: \(releaseDate ?? "-")"
        }
    }
    var artistName: String? {
        didSet{
            artistNameLabel.text = "Artist Name: \(artistName ?? "-")"
        }
    }
    var counrty: String? {
        didSet{
            counrtyLabel.text = "Country: \(counrty ?? "-")"
        }
    }
    var genres: String? {
        didSet{
            genresLabel.text = "Genre: \(genres ?? "-")"
        }
    }
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
        setupStackView()
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
    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [releaseDateLabel,
                                                       artistNameLabel,
                                                       counrtyLabel,
                                                       genresLabel
                                                      ])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16.0),
        ])
        releaseDateLabel.numberOfLines = .zero
        counrtyLabel.numberOfLines = .zero
        artistNameLabel.numberOfLines = .zero
        genresLabel.numberOfLines = .zero
    }
}
