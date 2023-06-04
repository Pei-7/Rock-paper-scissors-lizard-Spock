//
//  signs.swift
//  Rock paper scissors lizard Spock
//
//  Created by 陳佩琪 on 2023/6/3.
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissors
    case lizard
    case spock
    
    var emoji : String {
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "🖐️"
        case .scissors:
            return "✌️"
        case .lizard:
            return "🤌"
        case .spock:
            return "🖖"
        }
    }
    
    
    static var signArray : [Sign] {
        return [.rock, .paper, .scissors, .lizard, .spock]
    }
    
}


func randomSign() -> Sign {
    let index = Int.random(in: 0...4)
    switch index {
    case 0:
        return .rock
    case 1:
        return .paper
    case 2:
        return .scissors
    case 3:
        return .lizard
    default:
        return .spock
    }
}



