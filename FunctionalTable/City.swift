//
//  City.swift
//  TableViewPlay
//
//  Created by Joel Meng on 6/27/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import Foundation
import DeepDiff

struct City {
    let name: String
    let country: String
    let lat: Float
    let long: Float
    let shortDescription: String
}

extension City: Comparable {
    
    static func < (lhs: City, rhs: City) -> Bool {
        return lhs.name < rhs.name
    }
}
