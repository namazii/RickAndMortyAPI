//
//  CharacterInfoTableViewCell.swift
//  RickAndMortyAPI
//
//  Created by Назар Ткаченко on 23.04.2022.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
//    private var imageUrl: URL? {
//        didSet {
//
//        }
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.characterImageView.layer.cornerRadius = self.characterImageView.frame.width / 2
        self.characterImageView.clipsToBounds = true
    }
    
    func configure(with character: Character?) {
        nameLabel.text = character?.name
        speciesLabel.text = character?.species
        genderLabel.text = character?.gender
        NetworkManager.shared.fetchImage(from: character?.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
        }
    }
}
