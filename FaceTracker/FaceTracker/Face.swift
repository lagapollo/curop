//
//  Face.swift
//  FaceTracker
//
//  Created by Julien Hennet on 28/09/2017.
//  Copyright © 2017 Matthew Jones. All rights reserved.
//

import UIKit

@objc enum Expression: Int {
    case angry = 0
    case contemptuous
    case disgusted
    case scared
    case happy
    case sad
    case surprised
    case neutral
    
    func image() -> UIImage {
        switch self {
        case .angry:
            return UIImage(named: "angry")!
        case .contemptuous:
            return UIImage(named: "contemptuous")!
        case .disgusted:
            return UIImage(named: "disgusted")!
        case .scared:
            return UIImage(named: "scared")!
        case .happy:
            return UIImage(named: "happy")!
        case .sad:
            return UIImage(named: "sad")!
        case .surprised:
            return UIImage(named: "surprised")!
        case .neutral:
            return UIImage(named: "neutral")!
        }
    }
    
    func description() -> String {
        switch self {
        case .angry:
            return "angry"
        case .contemptuous:
            return "contemptuous"
        case .disgusted:
            return "disgusted"
        case .scared:
            return "scared"
        case .happy:
            return "happy"
        case .sad:
            return "sad"
        case .surprised:
            return "surprised"
        case .neutral:
            return "neutral"
        }
    }
}


@objc class Face: NSObject {
    
    static let minEcart: Double = 0.5
    var name: String?
    var baseValues: [Double]
    
    init(values val:[Double]) {
        self.baseValues = val
    }
    
    func calculateExpression(_ values: [Double]) -> Expression {
        var index = 0
        var ecart = 0.0
        print("=======================")
        for (i, val) in values.enumerated() {
            let newEcart = abs(baseValues[i] - val)
            print("\(Expression(rawValue: i)!.description()) : \(newEcart)")
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
    
    func getImage(_ values: [Double]) -> UIImage {
        let expression = calculateExpression(values)
        return expression.image()
    }
    
    
}
