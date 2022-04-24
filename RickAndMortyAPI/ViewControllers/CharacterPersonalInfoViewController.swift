//
//  CharacterPersonalInfoViewController.swift
//  RickAndMortyAPI
//
//  Created by Назар Ткаченко on 23.04.2022.
//

import UIKit

class CharacterPersonalInfoViewController: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterInfoLabel: UILabel!
    
    @IBOutlet weak var locatioharacterImage.image = UIImage(data: imageData)
            self.spinnerView.stopAnimating()
        }
        showSpinner(in: view)
        characterInfoLabel.text = character?.description
//        addEpisode(character)
//        fetchEpisode(from: episodeURL.first)
    }
    
   
    
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .white
        spinnerView.startAnimating()
        spinnerVnLabel: UILabel!
        
        var character: Character?
    //    var episod: [Episode] = []
    //    var episodeURL: [String] = []
        
        private var spinnerView = UIActivityIndicatorView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            NetworkManager.shared.fetchImage(from: character?.image) { imageData in
                self.ciew.center = characterInfoLabel.center
        spinnerView.hidesWhenStopped = true

        view.addSubview(spinnerView)
    }
    
    
//    private func fetchEpisode (from url: String?) -> Void {
//        NetworkManager.shared.fetchEpisode(from: url) { episode in
//            switch episode {
//
//            case .success(let episode):
//                self.locationLabel.text = episode.name
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    private func addEpisode(_ episode: Character?) -> Void {
//        guard let episodes = character?.episode else { return }
//        for episode in episodes {
//            episodeURL.append(episode)
//        }
//    }
}
