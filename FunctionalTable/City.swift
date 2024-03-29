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

// MARK: - Now city is difference aware

extension City: Hashable {}
extension City: DiffAware {
	var diffId: City {
		return self
	}
	
	static func compareContent(_ a: City, _ b: City) -> Bool {
		return a == b
	}
	
	typealias DiffId = Self
}
