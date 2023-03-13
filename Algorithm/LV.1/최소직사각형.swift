

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    var width = 0
    var height = 0
    
    for i in sizes {
        var sortedArr = i.sorted(by: >)
        width = max(width, sortedArr[0])
        height = max(height, sortedArr[1])
    }
    
    return width * height
}
