//
//  CharacterPersonalInfoViewController.swift
//  RickAndMortyAPI
//
//  Created by Назар Ткаченко on 23.04.2022.
//

import UIKit

class CharacterPersonalInfoViewController: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView! {
        didSet{
            characterImage.layer.cornerRadius = characterImage.frame.width / 2
        }
    }
    
    @IBOutlet weak var characterInfoLabel: UILabel!
    
    var character: Character?
    var episodes: [String] = []
    var episodeURL: [String] = []
    
    private var spinnerView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchImage(from: character?.image) { imageData in
            self.characterImage.image = UIImage(data: imageData)
            self.spinnerView.stopAnimating()
        }
        showSpinner(in: view)
        characterInfoLabel.text = character?.description
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.characterImage.layer.cornerRadius = self.characterImage.frame.width / 2
//    }
    
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .white
        spinnerView.startAnimating()
        spinnerView.center = characterInfoLabel.center
        spinnerView.hidesWhenStopped = true
        view.addSubview(spinnerView)
    }
    
}
