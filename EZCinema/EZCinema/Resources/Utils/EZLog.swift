//
//  EZLog.swift
//  EZCinema
//
//  Created by Edu on 18/07/21.
//

import Foundation

func ezLog(_ object: Any...) {
    
    #if DEBUG
    for item in object {
        Swift.print(item)
    }
    #endif
}

func ezLog(_ object: Any) {
    
    #if DEBUG
    Swift.print(object)
    #endif
}
