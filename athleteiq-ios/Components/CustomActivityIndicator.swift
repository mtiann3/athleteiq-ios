//
//  CustomActivityIndicator.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/22/24.
//

import UIKit

class CustomActivityIndicator: UIView {

    // MARK: - Properties
    private let activityIndicator = UIActivityIndicatorView()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    // MARK: - Private Methods
    private func setupView() {
        // Customize your activity indicator here
        activityIndicator.style = .large
        activityIndicator.color = .gray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Public Methods
    func startAnimating() {
        activityIndicator.startAnimating()
        isHidden = false
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
}

