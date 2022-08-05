//
//  Box.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 05/08/2022.
//  Copyright © 2022 Maxwell. All rights reserved.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ value:T){
        self.value = value
    }
    
    func bind(listener: Listener?){
        self.listener = listener
        listener?(value)
    }
}
