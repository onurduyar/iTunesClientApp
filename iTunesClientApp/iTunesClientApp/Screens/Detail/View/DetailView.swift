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
            releaseDateKeyLabel.text = "Release Date:"
            releaseDateKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            releaseDateLabel.text = releaseDate ?? "-"
            
        }
    }
    var artistName: String? {
        didSet{
            artistNameKeyLabel.text = "Artist Name:"
            artistNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            artistNameLabel.text = artistName ?? "-"
        }
    }
    var counrty: String? {
        didSet{
            countryKeyLabel.text = "Country:"
            countryKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            countryLabel.text = counrty ?? "-"
        }
    }
    var genres: String? {
        didSet{
            genresKeyLabel.text = "Genres:"
            genresKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            genresLabel.text = genres ?? "-"
        }
    }
    private(set) lazy var imageView = UIImageView()
    
    private let releaseDateKeyLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private lazy var releaseDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseDateKeyLabel, UIView(), releaseDateLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var artistNameKeyLabel = UILabel()
    private var artistNameLabel = UILabel()
    private lazy var artistNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [artistNameKeyLabel, UIView(), artistNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var countryKeyLabel = UILabel()
    private var countryLabel = UILabel()
    private lazy var countryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countryKeyLabel, UIView(), countryLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var genresKeyLabel = UILabel()
    private var genresLabel = UILabel()
    private lazy var genresStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [genresKeyLabel, UIView(), genresLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
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
        let stackView = UIStackView(arrangedSubviews: [releaseDateStackView,
                                                       artistNameStackView,
                                                       countryStackView,
                                                       genresStackView
                                                      ])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16.0),
        ])
        releaseDateLabel.numberOfLines = .zero
        countryLabel.numberOfLines = .zero
        artistNameLabel.numberOfLines = .zero
        genresLabel.numberOfLines = .zero
    }
}
