//
//  TopViewController.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 14.05.2021.
//

import UIKit

class TopViewController: UIViewController {
    
    let topLabel = UILabel()
    
    let usaButton = GradientButton(colors: [UIColor.white.cgColor, UIColor.blue.cgColor, UIColor.red.cgColor])
    let germanButton = GradientButton(colors: [UIColor.systemYellow.cgColor, UIColor.red.cgColor, UIColor.black.cgColor])
    let italianButton = GradientButton(colors: [UIColor.white.cgColor, UIColor.systemGreen.cgColor, UIColor.systemRed.cgColor])
    let africanButton = GradientButton(colors: [UIColor.black.cgColor, UIColor.systemYellow.cgColor, UIColor.systemGreen.cgColor, UIColor.white.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor])
    
    let stackView = UIStackView()
    
    let collectionView = UICollectionView(frame: .init(), collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    var currentArray: CurrentDataModel?
    
    var viewModel: TopVCViewModelProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        register()
        setLayout()
        setup()
        constraint()
        bindStuff()
    }
    
    func setLayout() {
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 270, height: 270)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func bindStuff() {
        viewModel?.changedValue.bind(observer: { (results) in
            guard let results = results else { return }
            self.viewModel?.currentStuff = results
        })
    }
    
    func setup() {
        [topLabel, stackView, collectionView].forEach { view.addSubview($0) }
        [usaButton, germanButton, italianButton, africanButton].forEach { stackView.addArrangedSubview($0) }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        topLabel.text = "YOYO hi there"
        
        usaButton.addTarget(self, action: #selector(usaButtonTapped), for: .touchUpInside)
        germanButton.addTarget(self, action: #selector(germButtonTapped), for: .touchUpInside)
        italianButton.addTarget(self, action: #selector(italianButtonTapped), for: .touchUpInside)
        africanButton.addTarget(self, action: #selector(africanButtonTapped), for: .touchUpInside)
        
        usaButton.setTitle("USA", for: .normal)
        germanButton.setTitle("Germany", for: .normal)
        italianButton.setTitle("Italy", for: .normal)
        africanButton.setTitle("Africa", for: .normal)
        
        topLabel.text = viewModel?.titleLabel
        topLabel.textColor = .systemBlue
        topLabel.font = UIFont.boldSystemFont(ofSize: 20)
        topLabel.textAlignment = .center

    }
    
    func register() {
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    func constraint() {
       
        topLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: stackView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        stackView.anchor(top: topLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: collectionView.leadingAnchor)
        collectionView.anchor(top: topLabel.bottomAnchor, leading: stackView.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
    }
    
    @objc func usaButtonTapped() {
        viewModel?.changedValue.value = viewModel?.usaTapped() ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
        collectionView.reloadData()
    }
    
    @objc func germButtonTapped() {
        viewModel?.changedValue.value = viewModel?.germTapped() ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
        collectionView.reloadData()

    }
    
    @objc func italianButtonTapped() {
        viewModel?.changedValue.value = viewModel?.itTapped() ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
        collectionView.reloadData()

    }
    
    @objc func africanButtonTapped() {
        viewModel?.changedValue.value = viewModel?.africanTapped() ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
        collectionView.reloadData()

    }

}


extension TopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfSections() ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.viewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        
        return cell
    }
    
    
}
