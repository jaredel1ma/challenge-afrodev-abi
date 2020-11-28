//
//  AppDelegate.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 25/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let presenter = BeerListPresenter()
        let service = NetworkService()
        let interactor = BeerListInteractor(presenter: presenter, service: service)
        let viewController = BeerListViewController(interactor: interactor)
        presenter.viewController = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
