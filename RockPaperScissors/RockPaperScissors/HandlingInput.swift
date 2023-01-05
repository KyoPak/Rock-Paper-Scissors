//
//  MukZiBa.swift
//  RockPaperScissors
//
//  Created by Kyo,Aaron on 2022/08/24.
//

class HandlingInput {
    func generateComputerInput() -> Int {
        let computerInput = Int.random(in: 1...3)
        return computerInput
    }

    func bringUserInput() -> String? {
        let input = readLine()
        return input
    }

    private func checkUserInput(input: String?) throws -> Bool {
        let errorSentence: String = Namespace.invalidInput.message

        guard let input = Int(input ?? "") else { throw InputError.numberError(message: errorSentence) }

        if 0...3 ~= input {
            return true
        }
        throw InputError.rangeError(message: errorSentence)
    }

    func castingUserInput(input: String?) -> Int {
        guard let input = Int(input ?? "") else { return 0 }
        
        return input
    }

    func checkValidInput(input: String?) -> Bool {
        do {
            let isCheck = try checkUserInput(input: input)
            return isCheck
        } catch InputError.numberError(let message) {
            print(message)
            return false
        } catch InputError.rangeError(let message) {
            print(message)
            return false
        } catch {
            return false
        }
    }
}

