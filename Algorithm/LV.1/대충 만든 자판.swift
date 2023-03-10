

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dict = [String: Int]() // 문자별 키 누르는 횟수 저장
    var answer = [Int]()
    
    // keymap을 순회하며 dict에 문자와 해당 문자를 입력하는데 필요한 최소한의 키 누르는 횟수 저장
    for i in 0..<keymap.count {
        let keys = keymap[i]
        for j in 0..<keys.count {
            let char = String(keys[keys.index(keys.startIndex, offsetBy: j)])
            if dict[char] == nil {
                dict[char] = j + 1
            } else {
                dict[char] = min(dict[char]!, j + 1)
            }
        }
    }
    
    // targets를 순회하며 문자열을 작성하는데 필요한 키 누르는 횟수 계산
    for target in targets {
        var count = 0
        var isPossible = true
        
        for i in 0..<target.count {
            let char = String(target[target.index(target.startIndex, offsetBy: i)])
            if let keyCount = dict[char] {
                count += keyCount
            } else {
                isPossible = false
                break
            }
        }
        
        answer.append(isPossible ? count : -1)
    }
    
    return answer
}

func solution1(_ keymap:[String], _ targets:[String]) -> [Int] {
    var map = [Character: Int]()
    var answer = [Int]()

    for key in keymap {
        key.enumerated().forEach {
            if map[$0.element, default: Int.max] > $0.offset {
                map[$0.element] = $0.offset + 1
            }
        }
    }

    targets.forEach {
        var sum = 0
        for target in $0 {
            guard let key = map[target] else { sum = -1; break }
            sum += key
        }
        answer.append(sum)
    }

    return answer
}
