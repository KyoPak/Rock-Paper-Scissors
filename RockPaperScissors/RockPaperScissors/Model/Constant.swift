//
//  MukZiBa.swift
//  RockPaperScissors
//
//  Created by Kyo,Aaron on 2022/08/24.
//

enum Turn: String {
    case userTurn = "사용자"
    case computerTurn = "컴퓨터"
    case undecidedTurn = "정해지지 않은 턴"
}

enum Namespace {
    case invalidInput
    case rpsStart
    case mzbStart(turn: String)
    case turn
    case win
    
    var message: String {
        switch self {
        case .invalidInput:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .rpsStart:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .mzbStart(let turn):
            return "[\(turn)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        case .turn:
            return "의 턴입니다"
        case .win:
            return "의 승리!"
        }
    }
}

enum GameResult {
    case lose
    case win
    case draw
    case end
    
    var message: String {
        switch self {
        case .lose:
            return "졌습니다!"
        case .win:
            return "이겼습니다!"
        case .draw:
            return "비겼습니다!"
        case .end:
            return "게임 종료"
        }
    }
}
