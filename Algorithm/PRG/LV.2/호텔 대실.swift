

import Foundation

var timeTable: [Int: Int] = [:]

func solution(_ book_time: [[String]]) -> Int {
    var ans = 0
    
    book_time.forEach { time in
        (time[0].timeValue...(time[1].timeValue+9)).forEach { value in
            timeTable[value, default: 0] += 1
            let count = timeTable[value, default: 0]
            ans = ans < count ? count : ans
        }
    }
    
    return ans
}

extension Character {
    var number: Int {
        return Int(self.asciiValue!) - 48
    }
}

extension String {
    var timeValue: Int {
        let array = Array(self)
        let first = (array[0].number * 10 + array[1].number) * 60
        let second = array[3].number * 10 + array[4].number
        return first + second
    }
}
