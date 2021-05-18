//
//  Box.swift
//  ITunesTopChart
//
//  Created by Denis Velikanov on 12.03.2021.
//

import Foundation

class Box <T> {
    
    typealias Observer = (T) -> ()
    
    var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    func bind(observer: @escaping Observer) {
        self.observer = observer
        observer(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
