//
//  gameResult.swift
//  Rock paper scissors lizard Spock
//
//  Created by 陳佩琪 on 2023/6/3.
//

import Foundation

enum GameResult {
    case scissorsPaper
    case paperRock
    case rockLizard
    case lizardSpock
    case spockScissors
    case scissorsLizard
    case lizardPaper
    case paperSpock
    case spockRock
    case rockScissor
    case draw
    
    var resultText: String {
        switch self {
        case .scissorsPaper:
            return "Scissors cuts Paper"
        case .paperRock:
            return "Paper covers Rock"
        case .rockLizard:
            return "Rock crushes Lizard"
        case .lizardSpock:
            return "Lizard poisons Spock"
        case .spockScissors:
            return "Spock smashes Scissors"
        case .scissorsLizard:
            return "Scissors decapitates Lizard"
        case .lizardPaper:
            return "Lizard eats Paper"
        case .paperSpock:
            return "Paper disproves Spock"
        case .spockRock:
            return "Spock vaporizes Rock"
        case .rockScissor:
            return "Rock crushes Scissors"
        default:
            return "It's a draw"
        }
    }
    
    var resultArray: [Sign] {
        switch self {
        case .scissorsPaper:
            return [.scissors, .paper]
        case .paperRock:
            return [.paper, .rock]
        case .rockLizard:
            return [.rock, .lizard]
        case .lizardSpock:
            return [.lizard, .spock]
        case .spockScissors:
            return [.spock, .scissors]
        case .scissorsLizard:
            return [.scissors, .lizard]
        case .lizardPaper:
            return [.lizard, .paper]
        case .paperSpock:
            return [.paper, .spock]
        case .spockRock:
            return [.spock, .rock]
        case .rockScissor:
            return [.rock, .scissors]
        default:
            return []
        }
    }
    
    

    
    
    var winnerSign: Sign {
        switch self {
        case .scissorsPaper:
            return .scissors
        case .paperRock:
            return .paper
        case .rockLizard:
            return .rock
        case .lizardSpock:
            return .lizard
        case .spockScissors:
            return .spock
        case .scissorsLizard:
            return .scissors
        case .lizardPaper:
            return .lizard
        case .paperSpock:
            return .paper
        case .spockRock:
            return .spock
        default:
            return .rock
        }
    }
    

    
}


