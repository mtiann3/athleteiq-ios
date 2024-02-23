//
//  ActivityIndicator.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/22/24.
//

import UIKit

class ActivityIndicator {

    private static var backgroundView: UIView?
    private static var activityIndicator: UIActivityIndicatorView?

    static func show() {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
                    return
            }

            if let currentWindow = windowScene.windows.first {
                // Create background view
                backgroundView = UIView(frame: currentWindow.bounds)
                backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                backgroundView?.alpha = 0.8
                currentWindow.addSubview(backgroundView!)

                // Create activity indicator
                activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator?.center = backgroundView!.center
                activityIndicator?.startAnimating()
                backgroundView!.addSubview(activityIndicator!)
            }
        }
    }

    static func hide() {
        DispatchQueue.main.async {
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
            activityIndicator = nil

            backgroundView?.removeFromSuperview()
            backgroundView = nil
        }
    }
}
