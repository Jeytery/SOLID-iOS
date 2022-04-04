//
//  LS.swift
//  LS
//
//  Created by Jeytery on 04.04.2022.
//

import Foundation

protocol Figure {
    var height: Double { get set }
    var width: Double { get set }
    
    func setSize(height: Double, width: Double)
}

// [!] Wrong abstraction for Circle [!]

// if height != width you will not have a circle
// you should think about more suitable abstaction for this class
class Circle: Figure {}



