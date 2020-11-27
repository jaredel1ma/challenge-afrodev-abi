//
//  LoadingView.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import UIKit

class LoadingView: UIView {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startAnimating()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .green
        addSubview(activityIndicator)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func hide() {
        self.isHidden = true
    }
    
    func show() {
        self.isHidden = false
    }
}
