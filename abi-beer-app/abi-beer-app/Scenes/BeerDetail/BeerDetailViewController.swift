//
//  BeerDetailViewController.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import UIKit
import SDWebImage

class BeerDetailViewController: UIViewController {
    
    lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.text = "Beer Name"
        
        return label
    }()
    
    lazy var beerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "camera")
        
        return imageView
    }()
    
    lazy var beerDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "Beer Detail"
        
        return label
    }()
    
    private let imageURL: URL
    private let productName: String
    private let productDetail: String
    
    init(imageURL: URL, productName: String, productDetail: String) {
        self.imageURL = imageURL
        self.productName = productName
        self.productDetail = productDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    private func setupView() {
        view.addSubview(beerNameLabel)
        view.addSubview(beerImageView)
        view.addSubview(beerDetailLabel)
        beerNameLabel.text = self.productName
        beerImageView.sd_setImage(with: self.imageURL, completed: nil)
        beerDetailLabel.text = self.productDetail
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            beerNameLabel.heightAnchor.constraint(equalToConstant: 30),
            beerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            beerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            beerNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            beerImageView.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: 30),
            beerImageView.widthAnchor.constraint(equalToConstant: 200),
            beerImageView.heightAnchor.constraint(equalToConstant: 150),
            beerImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            beerNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            beerDetailLabel.topAnchor.constraint(equalTo: beerImageView.bottomAnchor, constant: 10),
            beerDetailLabel.centerXAnchor.constraint(equalTo: beerImageView.centerXAnchor)
        ])
    }
}
