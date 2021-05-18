//
//  DataFetcherService.swift
//  GradientNewApp
//
//  Created by Denis Velikanov on 17.02.2021.
//

import Foundation

class FilmsDataFetcher {

    var networkDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = dataFetcher
    }

    func usaRequest(completion: @escaping (JSONModel?) -> Void) {
        let usaFilmsURL = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: usaFilmsURL, response: completion)
    }

    func germanRequest(completion: @escaping (JSONModel?) -> Void ) {
        let germanFilmsURL = "https://rss.itunes.apple.com/api/v1/de/ios-apps/new-apps-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: germanFilmsURL, response: completion)
    }

    func italianRequest(completion: @escaping (JSONModel?) -> Void ) {
        let italianFilmsURL = "https://rss.itunes.apple.com/api/v1/it/ios-apps/new-apps-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: italianFilmsURL, response: completion)
    }

    func republicOfSouthAfricaRequest(completion: @escaping (JSONModel?) -> Void ) {
        let republicOfSouthAfricaFilmsURL = "https://rss.itunes.apple.com/api/v1/za/ios-apps/new-apps-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: republicOfSouthAfricaFilmsURL, response: completion)
    }

}

