

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result = [Int]()
    
    for i in commands {
        result.append(array[i[0] - 1...i[1] - 1].sorted()[i[2] - 1])
    }
    
    return result
}
