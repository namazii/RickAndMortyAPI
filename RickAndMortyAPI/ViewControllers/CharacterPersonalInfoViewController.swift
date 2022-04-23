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
    
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchImage(from: character?.image) { imageData in
            self.characterImage.image = UIImage(data: imageData)
        }
    }
}
