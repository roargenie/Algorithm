

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {

    var stack = [Int]()
    var board = board
    var result = 0

    for move in moves {
        for i in 0..<board.count {
            if board[i][move - 1] != 0 {
                if stack.last == board[i][move - 1] {
                    stack.removeLast()
                    result += 2
                } else {
                    stack.append(board[i][move - 1])
                }
                board[i][move - 1] = 0
                break
            }
        }
    }

    return result
}
