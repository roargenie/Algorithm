

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var result: Bool = false
    var cards1 = cards1
    var cards2 = cards2
    var goal = goal
    
    while goal.count > 0 {
        if cards1.first == goal.first {
            cards1.remove(at: 0)
            goal.remove(at: 0)
        } else if cards2.first == goal.first {
            cards2.remove(at: 0)
            goal.remove(at: 0)
        } else {
            result = false
            break
        }
        if goal.count == 0 {
            result = true
        }
    }
    
    return result ? "Yes" : "No"
}
