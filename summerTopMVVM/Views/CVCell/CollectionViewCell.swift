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
        contentView.layer.borderColor = UIColor.magenta.cgColor
        contentView.layer.borderWidth = CGFloat(3)
        contentView.enableCornerRadius(radius: 20)
        contentView.backgroundColor = .darkGray
    }
    
    var viewModel: CVCellViewModelProtocol? {
        willSet(viewModel) {
            self.image.image = nil
            guard let viewModel = viewModel else { return }
            artistNameLabel.text = viewModel.artistName
            nameLabel.text = viewModel.name
            releaseLabel.text = viewModel.release
            let imageUrl = viewModel.imageURL
            
            guard let url = URL(string: imageUrl) else { return }
            let queue = DispatchQueue.global(qos: .utility)
            
            queue.async {
                guard let data = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    if url == url {
                        self.image.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    func setup() {
        contentView.addSubview(stackView)
        [artistNameLabel, nameLabel, releaseLabel, image].forEach { stackView.addArrangedSubview($0) }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.textAlignment = .center }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.textColor = .white }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.adjustsFontSizeToFitWidth = true }
        [artistNameLabel, nameLabel, releaseLabel].forEach { $0.numberOfLines = 0 }
        [artistNameLabel].forEach { $0.font = UIFont.boldSystemFont(ofSize: 22) }
        [nameLabel].forEach { $0.font = UIFont.systemFont(ofSize: 19) }
        releaseLabel.font = UIFont.italicSystemFont(ofSize: 16)
        
        stackView.axis = .vertical
        stackView.spacing = 5
        
        image.contentMode = .scaleToFill
        
    }
    
    func constraint() {
        stackView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor)
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
