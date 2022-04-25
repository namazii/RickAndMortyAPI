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
    
    private var activityIndicator: UIActivityIndicatorView?
    
    private var imageURL: URL? {
        didSet {
            characterImageView.image = nil
            updateImage()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.characterImageView.layer.cornerRadius = self.characterImageView.frame.width / 2
        self.characterImageView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator = showSpinner(in: characterImageView)
    }
    
    func configure(with character: Character?) {
        nameLabel.text = character?.name
        speciesLabel.text = character?.species
        genderLabel.text = character?.gender
        imageURL = URL(string: character?.image ?? "")
    }
    
    private func showSpinner(in view:UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
    private func updateImage() {
        guard let imageURL = imageURL else { return }
        getImage(from: imageURL) { result in
            switch result {
            case .success(let image):
                if imageURL == self.imageURL {
                    self.characterImageView.image = image
                    self.activityIndicator?.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension CharactersTableViewCell {
    // MARK: - ImageCache
    private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {

        if let cacheImage = ImageCache.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cacheImage))
            return
        }

        NetworkManager.shared.fetchImageCache(from: url) { result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else { return }
                ImageCache.shared.setObject(image, forKey: url.lastPathComponent as NSString)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
