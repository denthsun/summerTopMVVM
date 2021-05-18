//
//  BooksDataFetcher.swift
//  MVVM_Films2020
//
//  Created by Denis Velikanov on 08.03.2021.
//

import Foundation

class BooksDataFetcher {
    
    var networkDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = dataFetcher
    }
    
    func usaRequest(completion: @escaping (JSONModel?) -> Void) {
        let usaFilmsURL = "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: usaFilmsURL, response: completion)
    }
    
    func germanRequest(completion: @escaping (JSONModel?) -> Void ) {
        let germanFilmsURL = "https://rss.itunes.apple.com/api/v1/de/books/top-free/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: germanFilmsURL, response: completion)
    }
    
    func italianRequest(completion: @escaping (JSONModel?) -> Void ) {
        let italianFilmsURL = "https://rss.itunes.apple.com/api/v1/it/books/top-free/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: italianFilmsURL, response: completion)
    }
    
    func republicOfSouthAfricaRequest(completion: @escaping (JSONModel?) -> Void ) {
        let republicOfSouthAfricaFilmsURL = "https://rss.itunes.apple.com/api/v1/za/books/top-free/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: republicOfSouthAfricaFilmsURL, response: completion)
    }

}
