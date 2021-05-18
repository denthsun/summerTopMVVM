//
//  CVCellViewModel.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 16.05.2021.
//

import Foundation

class CVCellViewModel: CVCellViewModelProtocol {
    
    private var result: Results
    
    var artistName: String {
        return result.artistName
    }
    
    var name: String {
        return result.name
    }
    
    var release: String {
        return result.releaseDate
    }
    
    var imageURL: String {
        return result.artworkUrl100
    }
    
    init(result: Results) {
        self.result = result
    }
}
