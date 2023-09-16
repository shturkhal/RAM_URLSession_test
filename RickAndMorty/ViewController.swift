//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Іван Штурхаль on 02.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()
    var myImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var newColor = Settings.shared.colorTheme
        view.backgroundColor = newColor
        myLabel.frame = CGRect(x: 100, y: 350, width: 300, height: 300)
        self.view.addSubview(myLabel)
        setUpImage(imageView: myImage)
        // create urlString
        let urlString = "https://rickandmortyapi.com/api/character/108"
        // check with guard URL string
        guard let url = URL(string: urlString) else { return }
        // START URL Session with dataTask
        URLSession.shared.dataTask(with: url) { data, response, error in // (response) це відповідь з сервера
            // inside of URLSession we check with IF LET error
            if let error = error {
                print(error)
                return
            }
            // check data with guard let
            guard let data = data else { return }
            // create SESSION with guard let with JSON init and decode it
            guard let session = try? JSONDecoder().decode(Rik.self, from: data) else {
                print("СТАЛАСЯ ПОМИЛКА")
                return
            }
            DispatchQueue.main.async {
                self.myLabel.text = session.gender
                self.myLabel.numberOfLines = 0
                self.myImage.image = UIImage(contentsOfFile: session.image)
//                self.myImage.image = UIImage(named: session.image)
            }
            // print or else methods to get data from URL Session
            print(session.episode)
            // END the URLSession with response
        }.resume()
    }
    
    func setUpImage(imageView: UIImageView) {
        self.view.addSubview(imageView)
        
    
        imageView.frame = CGRect(x: 100, y: 100, width: 250, height: 250)
        imageView.backgroundColor = .blue
    }
}
