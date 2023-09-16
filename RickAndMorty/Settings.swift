//
//  Settings.swift
//  RickAndMorty
//
//  Created by Іван Штурхаль on 02.08.2023.
//

import UIKit

class Settings {
    
    static var shared = Settings()
    var colorTheme = UIColor.cyan
    
    
    func setUpImage(imageView: UIImageView, mainView: UIViewController) {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: mainView.view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: mainView.view.centerXAnchor)
        ])
    }
    
    private init() {}

}
