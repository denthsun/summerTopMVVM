//
//  CVCellViewModelProtocol.swift
//  summerTopMVVM
//
//  Created by Denis Velikanov on 16.05.2021.
//

import Foundation

protocol CVCellViewModelProtocol {
    var artistName: String { get }
    var name: String { get }
    var release: String { get }
    var imageURL: String { get }
}
