//
//  BeerListInteractor.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import Foundation

protocol BeerListInteractorProtocol {
    func didSelectBeer(beer: Beer)
    func listBeers()
}

class BeerListInteractor: BeerListInteractorProtocol {
    let presenter: BeerListPresenterProtocol
    let service: NetworkServiceProtocol
    
    init(presenter: BeerListPresenterProtocol, service: NetworkServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }
    
    func listBeers() {
        guard let url = URL(string: Environment.listBeerURL)
        else { return }
        service.requestData(url: url) {(result) in
            switch result {
            case .failure(let error):
                self.presenter.present(errorMessage: error.localizedDescription)
            case .success(let data):
                let beers = self.createdBeers(data: data)
                self.presenter.present(beers: beers)
            }
        }
    }
    
    func createdBeers(data: Data) -> [Beer] {
        var beers: [Beer] = []
        do {
            let decoder = JSONDecoder()
            let decodableBeers = try decoder.decode([Beer].self, from: data)
            beers = decodableBeers
        } catch let error {
            print(error.localizedDescription)
        }
        return beers
    }
    
    func didSelectBeer(beer: Beer) {
        presenter.presentDetail(beer: beer)
    }
}
