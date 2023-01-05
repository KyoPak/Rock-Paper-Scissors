//
//  MukZiBa.swift
//  RockPaperScissors
//
//  Created by Kyo,Aaron on 2022/08/24.
//

final class PlayGame: HandlingInput {
    func playRPS() -> Turn {
        let gameName = "RPS"
        var currentTurn: Turn
        
        while (true) {
            print(Namespace.rpsStart.message, terminator: "")
            
            let userInput: String? = bringUserInput()
            var userHands: RockScissorsPaper?
            let computerHands = RockScissorsPaper(rawValue: generateComputerInput())
            
            guard checkValidInput(input: userInput) == true else { continue }
            userHands = RockScissorsPaper(rawValue: castingUserInput(input: userInput))
            
            if userHands == RockScissorsPaper.exit {
                print(GameResult.end.message)
                currentTurn = .undecidedTurn
                return currentTurn
            }
            
            if checkDraw(userHands?.rawValue, computerHands?.rawValue) {
                print(GameResult.draw.message)
                continue
            }
            
            guard checkWin(gameName, userHands?.rawValue, computerHands?.rawValue) else {
                print(GameResult.lose.message)
                currentTurn = .computerTurn
                return currentTurn
            }
            print(GameResult.win.message)
            currentTurn = .userTurn
            return currentTurn
        }
    }
    
    func playMZB() {
        var currentTurn = playRPS()
        let gameName = "MZB"
        if currentTurn == .undecidedTurn {
            return
        }
        
        while (true) {
            print(Namespace.mzbStart(turn: currentTurn.rawValue).message, terminator: "")
            let userInput: String? = bringUserInput()
            var userHands: MukZiBa?
            let computerHands = MukZiBa(rawValue: generateComputerInput())
            
            guard checkValidInput(input: userInput) == true else { continue }
            userHands = MukZiBa(rawValue: castingUserInput(input: userInput))
            
            if userHands == MukZiBa.exit {
                print(GameResult.end.message)
                return
            }
            
            if checkDraw(userHands?.rawValue, computerHands?.rawValue) {
                print(currentTurn.rawValue + Namespace.win.message)
                break
            }
            
            guard checkWin(gameName, userHands?.rawValue, computerHands?.rawValue) else {
                currentTurn = .computerTurn
                print(currentTurn.rawValue + Namespace.turn.message)
                continue
            }
            currentTurn = .userTurn
            print(currentTurn.rawValue + Namespace.turn.message)
        }
    }
    
    private func checkDraw(_ userHands: Int?, _ computerHands: Int?) -> Bool {
        let drawNumber = 0
        guard let userHands = userHands, let computerHands = computerHands else { return false }
        let checkNumber = userHands - computerHands
        
        return checkNumber == drawNumber ? true : false
    }
    
    private func checkWin(_ gameName: String, _ userHands: Int?, _ computerHands: Int?) -> Bool {
        var winNumbers: [Int]
        
        switch gameName {
        case "RPS":
            winNumbers = [1, -2]
        case "MZB":
            winNumbers = [-1, 2]
        default:
            winNumbers = []
        }
        
        guard let userHands = userHands, let computerHands = computerHands else { return false }
        let checkNumber = userHands - computerHands
        return winNumbers.contains(checkNumber) ? true : false
    }
}
