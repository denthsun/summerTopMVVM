//
//  EnterVCViewModelProtocol.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 14.05.2021.
//

import Foundation

protocol EnterVCViewModelProtocol {
    
    var greetingsString: String { get }
    
    var commonBooks: CurrentDataModel { get set }
    var commonPodcasts: CurrentDataModel { get set }
    var commonFilms: CurrentDataModel { get set }
    
    var usaCurrentBooks: [Results] { get set }
    var germCurrentBooks: [Results] { get set }
    var itCurrentBooks: [Results] { get set }
    var africaCurrentBooks: [Results] { get set }
    
    var usaCurrentFilms: [Results] { get set }
    var germCurrentFilms: [Results] { get set }
    var itCurrentFilms: [Results] { get set }
    var africaCurrentFilms: [Results] { get set }
    
    var usaCurrentPodcasts: [Results] { get set }
    var germCurrentPodcasts: [Results] { get set }
    var itCurrentPodcasts: [Results] { get set }
    var africaCurrentPodcasts: [Results] { get set }
    
    func booksRequests()
    func podcastsRequests()
    func filmsRequests()
    
    func bookCollect()
    func podcastCollect()
    func filmsCollect()
    
    func viewModelBooks() -> TopVCViewModelProtocol?
    func viewModelPodcasts() -> TopVCViewModelProtocol?
    func viewModelFilms() -> TopVCViewModelProtocol?
}
