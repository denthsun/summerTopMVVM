//
//  TopVCViewModelProtocol.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 16.05.2021.
//

import Foundation

protocol TopVCViewModelProtocol {
    
    var currentCommonArray: CurrentDataModel { get set }
    var currentStuff: [Results] { get set }
    var changedValue: Box<[Results]?> { get set }
    var titleLabel: String { get set }

    
    func numberOfSections() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CVCellViewModelProtocol?

    func usaTapped() -> [Results]
    func germTapped() -> [Results]
    func itTapped() -> [Results]
    func africanTapped() -> [Results]
    
}
