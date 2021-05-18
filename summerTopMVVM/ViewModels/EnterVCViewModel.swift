//
//  EnterVCViewModel.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 14.05.2021.
//

import Foundation

class EnterVCViewModel: EnterVCViewModelProtocol {

    
    
    var commonBooks = CurrentDataModel(usa: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100:  "")], german: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], italian: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], african: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")])
    var commonPodcasts = CurrentDataModel(usa: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100:  "")], german: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], italian: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], african: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")])
    var commonFilms = CurrentDataModel(usa: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100:  "")], german: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], italian: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")], african: [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")])
    
    var usaCurrentBooks = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var germCurrentBooks = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var itCurrentBooks = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var africaCurrentBooks = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    
    var usaCurrentFilms = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var germCurrentFilms = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var itCurrentFilms = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var africaCurrentFilms = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    
    var usaCurrentPodcasts = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var germCurrentPodcasts = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var itCurrentPodcasts = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    var africaCurrentPodcasts = [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
    
    let booksFetcher = BooksDataFetcher()
    let filmsFetcher = FilmsDataFetcher()
    let podcastsFetcher = PodcastDataFetcher()
    
    let myGroup = DispatchGroup()
    
    var greetingsString: String = "Hello, welcome to ITunes top chart"
    
    let filmsButton = "FILMS"
    let podcastsButton = "PODCASTS"
    let booksButton = "BOOKS"
    
    func booksRequests() {
        myGroup.enter()
        let myQueue = DispatchQueue(label: "com.my.queue")
        let runQueue = DispatchQueue.global(qos: .utility)
        
        runQueue.async {
            self.booksFetcher.usaRequest { (usaBooks) in
                self.usaCurrentBooks = usaBooks?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonBooks.usa = self.usaCurrentBooks
                }
            }
            
            self.booksFetcher.germanRequest { (germanBooks) in
                self.germCurrentBooks = germanBooks?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonBooks.german = self.germCurrentBooks
                }
            }
            
            self.booksFetcher.italianRequest { (itBooks) in
                self.itCurrentBooks = itBooks?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonBooks.italian = self.itCurrentBooks
                }
            }
            
            self.booksFetcher.republicOfSouthAfricaRequest { (africanBooks) in
                self.africaCurrentBooks = africanBooks?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonBooks.african = self.africaCurrentBooks
                    self.bookCollect()
                }
            }
        }
    }
    
    func bookCollect() {
        print(commonBooks)
        myGroup.leave()
    }
    
    func podcastsRequests() {
        myGroup.enter()
        let myQueue = DispatchQueue(label: "com.my.queue")
        let runQueue = DispatchQueue.global(qos: .utility)
        
        runQueue.async {
            self.podcastsFetcher.usaRequest { (usaPodcast) in
                self.usaCurrentPodcasts = usaPodcast?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonPodcasts.usa = self.usaCurrentPodcasts
                }
            }
            
            self.podcastsFetcher.germanRequest { (germPodcast) in
                self.germCurrentPodcasts = germPodcast?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonPodcasts.german = self.germCurrentPodcasts
                }
            }
            
            self.podcastsFetcher.italianRequest { (itPodcast) in
                self.itCurrentPodcasts = itPodcast?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonPodcasts.italian = self.itCurrentPodcasts
                }
            }
            
            self.podcastsFetcher.republicOfSouthAfricaRequest { (africaPodcast) in
                self.africaCurrentPodcasts = africaPodcast?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonPodcasts.african = self.africaCurrentPodcasts
                    self.podcastCollect()
                }
            }
        }
    }
    
    func podcastCollect() {
        print(commonPodcasts)
        myGroup.leave()
    }
    
    func filmsRequests() {
        myGroup.enter()
        let myQueue = DispatchQueue(label: "com.my.queue")
        let runQueue = DispatchQueue.global(qos: .utility)
        
        runQueue.async {
            
            self.filmsFetcher.usaRequest { (usaFilm) in
                self.usaCurrentFilms = usaFilm?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonFilms.usa = self.usaCurrentFilms
                }
            }
            
            self.filmsFetcher.germanRequest { (germFilms) in
                self.germCurrentFilms = germFilms?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonFilms.german = self.germCurrentFilms
                }
            }
            
            self.filmsFetcher.italianRequest { (itFilm) in
                self.itCurrentFilms = itFilm?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonFilms.italian = self.itCurrentFilms
                }
            }
            
            
            self.filmsFetcher.republicOfSouthAfricaRequest { (africaFilm) in
                self.africaCurrentFilms = africaFilm?.feed.results ?? [Results(artistName: "", releaseDate: "", name: "", artworkUrl100: "")]
                myQueue.sync {
                    self.commonFilms.african = self.africaCurrentFilms
                    self.filmsCollect()
                }
            }
            
        }
    }
    
    func filmsCollect() {
        print(commonFilms)
        myGroup.leave()
    }
    
    
    func viewModelBooks() -> TopVCViewModelProtocol? {
        return TopVCViewModel(currentStuff: commonBooks.usa,
                              currentCommonArray: commonBooks,
                              titleLabel: "Books")
    }
    
    func viewModelPodcasts() -> TopVCViewModelProtocol? {
        return TopVCViewModel(currentStuff: commonPodcasts.usa,
                              currentCommonArray: commonPodcasts,
                              titleLabel: "Podcasts")
    }
    
    func viewModelFilms() -> TopVCViewModelProtocol? {
        return TopVCViewModel(currentStuff: commonFilms.usa,
                              currentCommonArray: commonFilms,
                              titleLabel: "Apps")
    }
    
}
