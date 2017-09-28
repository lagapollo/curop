//
//  Face.swift
//  FaceTracker
//
//  Created by Julien Hennet on 28/09/2017.
//  Copyright © 2017 Matthew Jones. All rights reserved.
//

import Foundation

enum Expression: Int {
    case angry = 0
    case contemptuous
    case disgusted
    case scared
    case happy
    case sad
    case surprised
    case neutral
}


class Face {
    
    static let minEcart: Double = 0.5
    var name: String?
    var baseValues: [Double]
    
    init(values val:[Double]) {
        self.baseValues = val
    }
    
    func calculateExpression(_ values: [Double]) -> Expression {
        var index = 0
        var ecart = 0.0
        for (i, val) in values.enumerated() {
            let newEcart = abs(baseValues[i] - val)
            if  newEcart > ecart {
                index = i
                ecart = newEcart
            }
        }
        if ecart > Face.minEcart {
            return Expression(rawValue: index)!
        }
        return Expression.neutral
    }
    
    
}
