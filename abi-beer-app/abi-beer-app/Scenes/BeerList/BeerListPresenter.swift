//
//  BeerListPresenter.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import Foundation

protocol BeerListPresenterProtocol {
    func present(beers: [Beer])
    func present(errorMessage: String)
    func presentDetail(beer: Beer)
}

class BeerListPresenter: BeerListPresenterProtocol {
    var viewController: BeerListViewDisplay?
    
    func present(beers: [Beer]) {
        DispatchQueue.main.async {
            self.viewController?.showList(beers: beers)
        }
    }
    
    func present(errorMessage: String) {
        DispatchQueue.main.async {
            self.viewController?.showError(message: errorMessage)
        }
    }
    
    func presentDetail(beer: Beer) {
        guard let url = URL(string: beer.imageURLString)  else { return }
        let detailViewController = BeerDetailViewController(imageURL: url, productName: beer.product, productDetail: beer.description)
        viewController?.showDetail(viewController: detailViewController)
    }
}
