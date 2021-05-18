//
//  TopVCViewModel.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 16.05.2021.
//

import Foundation

class TopVCViewModel: TopVCViewModelProtocol {
    
    
    var changedValue: Box<[Results]?> = Box(nil)
    
    var currentCommonArray: CurrentDataModel
    
    var currentStuff: [Results]
    
    var titleLabel: String
    
    func numberOfSections() -> Int {
        return (currentStuff.count)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CVCellViewModelProtocol? {
        
        let result = currentStuff[indexPath.row] 
        
        
        return CVCellViewModel(result: result)
    }
    
    func usaTapped() -> [Results] {
        return currentCommonArray.usa 
    }
    
    func germTapped() -> [Results] {
        return currentCommonArray.german 

    }
    
    func itTapped() -> [Results] {
        return currentCommonArray.italian 

    }
    
    func africanTapped() -> [Results] {
        return currentCommonArray.african 

    }
    
    
    init(currentStuff: [Results], currentCommonArray: CurrentDataModel, titleLabel: String) {
        self.currentStuff = currentStuff
        self.currentCommonArray = currentCommonArray
        self.titleLabel = titleLabel
    }
    
    
}
