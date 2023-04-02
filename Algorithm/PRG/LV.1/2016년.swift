

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    
    var month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var monthOfDayDic = [0: "THU", 1: "FRI", 2: "SAT", 3: "SUN", 4: "MON", 5: "TUE", 6: "WED"]
    var day = b
    
    for i in 1..<a {
        day += month[i - 1]
    }
    
    return monthOfDayDic[day % 7]!
}

//MARK: - 더 나은 풀이

func solution1(_ a:Int, _ b:Int) -> String {

    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDay = monthDay[0..<a-1].reduce(0, +) + b

    return w[totalDay % 7]
}

