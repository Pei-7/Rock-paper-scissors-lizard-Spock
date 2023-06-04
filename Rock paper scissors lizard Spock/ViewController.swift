//
//  ViewController.swift
//  Rock paper scissors lizard Spock
//
//  Created by 陳佩琪 on 2023/6/3.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var homePageView: UIView!
    @IBOutlet var instructionView: UIView!
    @IBOutlet var playerView1: UIView!
    
    @IBOutlet var playerIcon: UILabel!
    @IBOutlet var finalResultIcon: UILabel!
    let winIcon = ["🥳","😆","😚","😊"]
    let loseIcon = ["😵","😟","😣","🥺"]
    
    @IBOutlet var resultString: UILabel!
    @IBOutlet var plainResultNoticeLabel: UILabel!
    
    @IBOutlet var finalResultView: UIView!
    @IBOutlet var finalResultLabel: UILabel!
    
    @IBOutlet var playerView2: UIView!
    
    @IBOutlet var player1View: UIView!
    @IBOutlet var player2View: UIView!
    
    @IBOutlet var player1Notice: UILabel!
    @IBOutlet var player2Notice: UILabel!
    
    @IBOutlet var twoPlayer1WinCountLabel: UILabel!
    @IBOutlet var twoPlayer2WinCountLabel: UILabel!
    
    @IBOutlet var resultString2: UILabel!
    let player1Sign = UILabel()
    let player2Sign = UILabel()
    
    @IBOutlet var twoFinalResult: UIView!
    
    @IBOutlet var twoFinalView1: UIView!
    @IBOutlet var twoFinalView2: UIView!
    
    @IBOutlet var twoResultLabel: UILabel!
    @IBOutlet var twoResultLabel2: UILabel!
    
    @IBOutlet var twoPlayer1Emoji: UILabel!
    @IBOutlet var twoPlayer2Emoji: UILabel!
    
    @IBOutlet var twoPlayer1EmojiFinal: UILabel!
    @IBOutlet var twoPlayer2EmojiFinal: UILabel!
    
    
    @IBOutlet var buttonsCollection: [UIButton]!
    
    @IBOutlet var player1Buttons: [UIButton]!
    @IBOutlet var player2Buttons: [UIButton]!
    
    var signSelected = UILabel()
    var computerSelected = UILabel()
    var answerArray: [Sign] = []
    var gameResult: GameResult?
    
    var player1WinCount = 0
    var player2WinCount = 0
    
    
    @IBOutlet var player1WinCountLabel: UILabel!
    @IBOutlet var player2WinCountLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        instructionView.isHidden = true
        playerView1.isHidden = true
        finalResultView.isHidden = true
        twoFinalResult.isHidden = true
        
        signSelected.isHidden = false
        computerSelected.isHidden = false
        
        playerView2.isHidden = true

        player2View.transform = CGAffineTransform(rotationAngle: .pi)
        twoFinalView2.transform = CGAffineTransform(rotationAngle: .pi)
        
        
    }

    
    @IBAction func showInstruction(_ sender: Any) {
        instructionView.isHidden = false
    }
    
    
    @IBAction func returnFromInstructionPage(_ sender: Any) {
        instructionView.isHidden = true
    }
    
    
    @IBAction func toONE(_ sender: Any) {
        playerView1.isHidden = false
        resetTheGame1()
    }
    
    @IBAction func toTwo(_ sender: Any) {
        playerView2.isHidden = false
        resetTheGame2()
    }
    
    
    
    @IBAction func returnFromPlayer1View(_ sender: Any) {
        playerView1.isHidden = true
    }
    
    @IBAction func returnFromPlayer2View(_ sender: Any) {
        playerView2.isHidden = true
    }
    
    
    func roundButtonFormatter(label: UILabel, x: Double, y: Double, size: Double, fontSize: Double) {
        label.frame = CGRect(x: x, y: y, width: size, height: size)
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = size / 2
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize)
    }
    

    @IBAction func selectSign(_ sender: UIButton) {
        
        signSelected.text = sender.titleLabel?.text
        roundButtonFormatter(label: signSelected, x: 198, y: 401, size: 120, fontSize: 72)
        playerView1.addSubview(signSelected)
        
        let selectedSign = Sign.signArray.first(where: {$0.emoji == sender.titleLabel?.text})!
        answerArray.append(selectedSign)
        
        roundButtonFormatter(label: computerSelected, x: 70, y: 273, size: 120, fontSize: 72)
        let computerSign = randomSign()
        computerSelected.text = computerSign.emoji
        playerView1.addSubview(computerSelected)
        answerArray.append(computerSign)
        
        //print(answerArray)

        lookUpResultString(array: answerArray, string: resultString)
        
        if gameResult != .draw {
            if selectedSign == gameResult!.winnerSign {
                player1WinCount += 1
                plainResultNoticeLabel.text = "You Won!"
                let index = Int.random(in: 1...3)
                playerIcon.text = winIcon[index]
            } else {
                player2WinCount += 1
                plainResultNoticeLabel.text = "You Lost!"
                let index = Int.random(in: 1...3)
                playerIcon.text = loseIcon[index]
            }
        } else {
            plainResultNoticeLabel.text = "Draw."
            playerIcon.text = "🙂"
        }
        
        player1WinCountLabel.text = "Win: \(player1WinCount) / 5"
        player2WinCountLabel.text = "Win: \(player2WinCount) / 5"
         
        if player1WinCount == 5 || player2WinCount == 5 {
            finalResultView.isHidden = false
            if player1WinCount == 5 {
                finalResultLabel.text = "You won the game!"
                finalResultIcon.text = winIcon[0]
            } else {
                finalResultLabel.text = "You lost the game!"
                finalResultIcon.text = loseIcon[0]
            }
            signSelected.removeFromSuperview()
            computerSelected.removeFromSuperview()
        }
        
        answerArray.removeAll()
    }
    

    fileprivate func resetTheGame1() {
        finalResultView.isHidden = true
        plainResultNoticeLabel.text = ""
        player1WinCount = 0
        player2WinCount = 0
        player1WinCountLabel.text = "Win: \(player1WinCount) / 5"
        player2WinCountLabel.text = "Win: \(player2WinCount) / 5"
        resultString.text = "Rock, Paper, Scissors,\nLizard, Spock?"
        resultString.transform = CGAffineTransform(rotationAngle: .pi/180 * 0)
        signSelected.removeFromSuperview()
        computerSelected.removeFromSuperview()
        playerIcon.text = "🙂"
    }
    
    func resetTheGame2() {
        next()
        twoFinalResult.isHidden = true
        twoResultLabel.text = ""
        twoResultLabel2.text = ""
        player1WinCount = 0
        player2WinCount = 0
        twoPlayer1WinCountLabel.text = "Win: \(player1WinCount) / 5"
        twoPlayer2WinCountLabel.text = "Win: \(player2WinCount) / 5"
        twoPlayer1Emoji.text = "🙂"
        twoPlayer2Emoji.text = "🙂"
    }
    
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        resetTheGame1()
    }
    
    
    
// 2 player
    
    
    @IBAction func player1Selection(_ sender: UIButton) {
        
        for button in player1Buttons {
            button.isEnabled = false
        }
        
        player1Sign.text = sender.titleLabel?.text
        roundButtonFormatter(label: player1Sign, x: 198, y: 1, size: 120, fontSize: 72)
        player1View.addSubview(player1Sign)
        
        let selectedSign = Sign.signArray.first(where: {$0.emoji == sender.titleLabel?.text})!
        answerArray.append(selectedSign)
        
        //print("1",answerArray)
        
        if answerArray.count == 2 {
            lookUpResultString(array: answerArray, string: resultString2)
            
            if gameResult != .draw {
                if selectedSign == gameResult!.winnerSign {
                    player1WinCount += 1
                    player1Notice.text = "You Won!"
                    player2Notice.text = "You Lost!"
                    let index = Int.random(in: 1...3)
                    twoPlayer1Emoji.text = winIcon[index]
                    twoPlayer2Emoji.text = loseIcon[index]
                } else {
                    player2WinCount += 1
                    player1Notice.text = "You Lost!"
                    player2Notice.text = "You Won!"
                    let index = Int.random(in: 1...3)
                    twoPlayer1Emoji.text = loseIcon[index]
                    twoPlayer2Emoji.text = winIcon[index]
                }
            } else {
                player1Notice.text = "Draw."
                player2Notice.text = "Draw."
                twoPlayer1Emoji.text = "🙂"
                twoPlayer2Emoji.text = "🙂"
            }
            
            updateWinCount(mainPlayerWinCount: twoPlayer1WinCountLabel, theOtherWinCount: twoPlayer2WinCountLabel,mainWinCountInt: player1WinCount, theOtherWinCountInt: player2WinCount,  finalView: twoFinalResult, mainResultLabel: twoResultLabel, theOtherResultLabel: twoResultLabel2, mainEmoji: twoPlayer1EmojiFinal, theOtherEmoji: twoPlayer2EmojiFinal)
        }
    }
    
    
    @IBAction func player2Selection(_ sender: UIButton) {
        for button in player2Buttons {
            button.isEnabled = false
        }
        
        player2Sign.text = sender.titleLabel?.text
        roundButtonFormatter(label: player2Sign, x: 198, y: 43, size: 120, fontSize: 72)
        player2View.addSubview(player2Sign)
        
        let selectedSign = Sign.signArray.first(where: {$0.emoji == sender.titleLabel?.text})!
        
        answerArray.append(selectedSign)
        
        //print("2",answerArray)
        if answerArray.count == 2 {
            lookUpResultString(array: answerArray, string: resultString2)
            
            if gameResult != .draw {
                if selectedSign == gameResult!.winnerSign {
                    player2WinCount += 1
                    player2Notice.text = "You Won!"
                    player1Notice.text = "You Lost!"
                    let index = Int.random(in: 1...3)
                    twoPlayer2Emoji.text = winIcon[index]
                    twoPlayer1Emoji.text = loseIcon[index]
                } else {
                    player1WinCount += 1
                    player2Notice.text = "You Lost!"
                    player1Notice.text = "You Won!"
                    let index = Int.random(in: 1...3)
                    twoPlayer2Emoji.text = loseIcon[index]
                    twoPlayer1Emoji.text = winIcon[index]
                }
            } else {
                player1Notice.text = "Draw."
                player2Notice.text = "Draw."
                twoPlayer1Emoji.text = "🙂"
                twoPlayer2Emoji.text = "🙂"
            }
            
            updateWinCount(mainPlayerWinCount: twoPlayer2WinCountLabel, theOtherWinCount: twoPlayer1WinCountLabel,mainWinCountInt: player2WinCount, theOtherWinCountInt: player1WinCount, finalView: twoFinalResult, mainResultLabel: twoResultLabel2, theOtherResultLabel: twoResultLabel, mainEmoji: twoPlayer2EmojiFinal, theOtherEmoji: twoPlayer1EmojiFinal)
        }
    }
    
    
    func lookUpResultString(array: [Sign], string: UILabel) {

        switch Set(array) {
        case Set([.scissors, .paper]):
            gameResult = .scissorsPaper
        case Set([.paper, .rock]):
            gameResult = .paperRock
        case Set([.rock, .lizard]):
            gameResult = .rockLizard
        case Set([.lizard, .spock]):
            gameResult = .lizardSpock
        case Set([.spock, .scissors]):
            gameResult = .spockScissors
        case Set([.scissors, .lizard]):
            gameResult = .scissorsLizard
        case Set([.lizard, .paper]):
            gameResult = .lizardPaper
        case Set([.paper, .spock]):
            gameResult = .paperSpock
        case Set([.spock, .rock]):
            gameResult = .spockRock
        case Set([.rock, .scissors]):
            gameResult = .rockScissor
        default:
            gameResult = .draw
        }
        
        string.text = gameResult?.resultText
        string.transform = CGAffineTransform(rotationAngle: .pi / 180 * -15)


    }
    
    func updateWinCount(mainPlayerWinCount: UILabel, theOtherWinCount: UILabel, mainWinCountInt: Int, theOtherWinCountInt: Int, finalView: UIView, mainResultLabel: UILabel, theOtherResultLabel: UILabel, mainEmoji: UILabel, theOtherEmoji: UILabel) {
        
        mainPlayerWinCount.text = "Win: \(mainWinCountInt) / 5"
        theOtherWinCount.text = "Win: \(theOtherWinCountInt) / 5"
        
         if mainWinCountInt == 5 || theOtherWinCountInt == 5 {
             finalView.isHidden = false
             if mainWinCountInt == 5 {
                 mainResultLabel.text = "You won the game!"
                 theOtherResultLabel.text = "You lost the game!"
                 mainEmoji.text = winIcon[0]
                 theOtherEmoji.text = loseIcon[0]
             } else {
                 mainResultLabel.text = "You lost the game!"
                 theOtherResultLabel.text = "You won the game!"
                 mainEmoji.text = loseIcon[0]
                 theOtherEmoji.text = winIcon[0]
             }

         }

    }
    
    func next() {
        answerArray.removeAll()
        
        for button in buttonsCollection {
            button.isEnabled = true
        }
        
        resultString2.text = "Rock, Paper, Scissors,\nLizard, Spock?"
        resultString2.transform = CGAffineTransform(rotationAngle: .pi/180 * 0)
        player1Sign.removeFromSuperview()
        player2Sign.removeFromSuperview()
        player1Notice.text = ""
        player2Notice.text = ""
    }
    
    @IBAction func goToNext(_ sender: Any) {
        next()
    }
    
    
    @IBAction func playAgain2(_ sender: Any) {
        resetTheGame2()
    }
    
    
}

