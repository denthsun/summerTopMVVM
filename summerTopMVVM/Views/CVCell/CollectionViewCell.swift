//
//  CollectionViewCell.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 16.05.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"

    let stackView = UIStackView()
    let artistNameLabel = UILabel()
    let nameLabel = UILabel()
    let releaseLabel = UILabel()
    let image = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        constraint()
        contentView.layer.borderColor = UIColor.systemPink.cgColor
        contentView.layer.borderWidth = CGFloat(3)
    }
    
    var viewModel: CVCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            artistNameLabel.text = viewModel.artistName
            nameLabel.text = viewModel.name
            releaseLabel.text = viewModel.release
            let imageUrl = viewModel.imageURL
            
            guard let url = URL(string: imageUrl) else { return }
            let queue = DispatchQueue.global(qos: .utility)
            
            queue.async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        if imageUrl == imageUrl {
                            self.image.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
    }
    
    func setup() {
        contentView.addSubview(stackView)
        [artistNameLabel, nameLabel, releaseLabel, image].forEach { stackView.addArrangedSubview($0) }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.textAlignment = .center }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.textColor = .systemRed }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.adjustsFontSizeToFitWidth = true }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.numberOfLines = 0 }
        [artistNameLabel, nameLabel].forEach { $0.font = UIFont.boldSystemFont(ofSize: 20) }
        releaseLabel.font = UIFont.italicSystemFont(ofSize: 18)
        
        stackView.axis = .vertical
        stackView.spacing = 5
    }
    
    func constraint() {
        stackView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor)
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
