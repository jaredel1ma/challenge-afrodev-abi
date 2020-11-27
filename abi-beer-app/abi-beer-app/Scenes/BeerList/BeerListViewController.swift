//
//  BeerListViewController.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 25/11/20.
//

import UIKit

protocol BeerListViewDisplay {
    func showList(beers: [Beer])
    func showError(message: String)
    func showLoading()
    func hideLoading()
    func showDetail(viewController: UIViewController)
}

class BeerListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var loadingView: LoadingView = {
        let view = LoadingView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let cellId = "ProductCell"
    let interactor: BeerListInteractorProtocol
    private var beers = [Beer]()
    
    init(interactor: BeerListInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        interactor.listBeers()
    }
    
    private func setupView() {
        title = "Challenge AfroDev"
        view.addSubview(tableView)
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension BeerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        interactor.didSelectBeer(beer: beer)
    }
}

extension BeerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? BeerTableViewCell
        else { return UITableViewCell() }
        let beer = beers[indexPath.row]
        cell.configureCell(beer: beer)
        
        return cell
    }
}

extension BeerListViewController: BeerListViewDisplay {
    func showError(message: String) {
        print(message)
    }
    
    func showList(beers: [Beer]) {
        self.beers = beers
        tableView.reloadData()
    }
    
    func showLoading() {
        loadingView.show()
    }
    
    func hideLoading() {
        loadingView.hide()
    }
    
    func showDetail(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
