//
//  EnterViewController.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 14.05.2021.
//

import UIKit
import TransitionButton

class EnterViewController: UIViewController {
    
    let viewModel = EnterVCViewModel()
    
    let greetingLabel = UILabel()
    let spinner = TransitionButton()
    let stackView = UIStackView()
    
    let podcastsButton = GradientButton(colors: [UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor])
    let booksButton = GradientButton(colors: [UIColor.systemYellow.cgColor, UIColor.systemPink.cgColor])
    let appsButton = GradientButton(colors: [UIColor.systemTeal.cgColor, UIColor.systemGreen.cgColor])
    
    var currentArrayBlyat = CurrentDataModel(usa: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], german: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], italian: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], african: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        constraint()
        downloads()
    }
    
    
    func setup() {
        [greetingLabel, spinner, stackView].forEach { view.addSubview($0) }
      
        spinner.spinnerColor = .magenta
        spinner.startAnimation()
        
        greetingLabel.text = "downloading..."
        greetingLabel.textAlignment = .center
        greetingLabel.textColor = .systemYellow
        greetingLabel.font = UIFont.boldSystemFont(ofSize: 30)
        greetingLabel.adjustsFontSizeToFitWidth = true
        greetingLabel.numberOfLines = 0
        
        [podcastsButton, booksButton, appsButton].forEach { stackView.addArrangedSubview($0) }
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        podcastsButton.setTitle(viewModel.podcastsButton, for: .normal)
        booksButton.setTitle(viewModel.booksButton, for: .normal)
        appsButton.setTitle(viewModel.appsButton, for: .normal)
        
        podcastsButton.addTarget(self, action: #selector(podcastTap), for: .touchUpInside)
        booksButton.addTarget(self, action: #selector(bookTap), for: .touchUpInside)
        appsButton.addTarget(self, action: #selector(filmTap), for: .touchUpInside)
        
        stackView.alpha = 0
    }
    
    func constraint() {
        greetingLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: spinner.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        spinner.anchor(top: greetingLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        stackView.anchor(top: greetingLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        greetingLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
    }
    
    func downloads() {
        viewModel.booksRequests()
        viewModel.filmsRequests()
        viewModel.podcastsRequests()
        
        viewModel.myGroup.notify(queue: DispatchQueue.main) {
            self.spinner.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                self.stackView.alpha = 1
                self.greetingLabel.text = self.viewModel.greetingsString
                self.greetingLabel.alpha = 1
            }
        }
    }
    
    @objc func filmTap() {
        currentArrayBlyat = viewModel.commonFilms
        
        let vc = TopViewController()
        vc.viewModel = viewModel.viewModelFilms()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func podcastTap() {
        currentArrayBlyat = viewModel.commonPodcasts
        
        let vc = TopViewController()
        vc.viewModel = viewModel.viewModelPodcasts()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func bookTap() {
        currentArrayBlyat = viewModel.commonBooks 
        
        let vc = TopViewController()
        vc.viewModel = viewModel.viewModelBooks()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
