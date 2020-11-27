//
//  BeerTableViewCell.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import UIKit
import SDWebImage

class BeerTableViewCell: UITableViewCell {
    
    lazy var beerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Beer Name"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beerDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Beer Detail"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beerPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Beer Price"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        addSubview(beerImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(beerNameLabel)
        stackView.addArrangedSubview(beerDetailLabel)
        addSubview(beerPriceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            beerImageView.heightAnchor.constraint(equalToConstant: 90),
            beerImageView.widthAnchor.constraint(equalToConstant: 80),
            beerImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            beerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            beerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: beerImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 10),
            beerPriceLabel.heightAnchor.constraint(equalToConstant: 40),
            beerPriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -10),
            beerPriceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            beerPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(beer: Beer) {
        self.beerNameLabel.text = beer.product
        self.beerDetailLabel.text = beer.description
        self.beerPriceLabel.text = "R$ \(beer.price)"
        if beer.discount {
            self.beerPriceLabel.textColor = UIColor(red: 36/255, green: 138/255, blue: 61/255, alpha: 0.8)
        }
        let url = URL(string: beer.imageURLString)
        beerImageView.sd_setImage(with: url, completed: nil)
    }
}
