

import Foundation

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    var words = words
    var queue: [(String, Int)] = [(begin, 0)]
    var visited = Set<String>()
    var result = 0
    
    while !queue.isEmpty {
        let (str, count) = queue.removeFirst()
        
        if !words.contains(target) {
            result = 0
            break
        }
        if str == target {
            result = count
            break
        }
        
        var validWords: [String] = []
        var sameWordsCount = 0
        for word in words {
            for i in str.indices {
                if word[i] == str[i] {
                    sameWordsCount += 1
                }
            }
            if sameWordsCount == str.count - 1 {
                validWords.append(word)
            }
            sameWordsCount = 0
        }
        
        for validWord in validWords {
            if !visited.contains(validWord) {
                visited.insert(validWord)
                queue.append((validWord, count + 1))
            }
        }
    }
    
    return result
}


func solution1(_ begin: String, _ target: String, _ words: [String]) -> Int {
    var queue = [(begin, 0)] // (현재 문자열, 변환 횟수)
    var visited = Set<String>() // 방문한 문자열 저장
    visited.insert(begin)
    
    while !queue.isEmpty {
        let (str, count) = queue.removeFirst()
        if str == target {
            return count
        }
        for word in words {
            if !visited.contains(word) && isConvertible(str, word) {
                visited.insert(word)
                queue.append((word, count + 1))
            }
        }
    }
    return 0 // 변환 불가능한 경우
}

func isConvertible(_ str1: String, _ str2: String) -> Bool {
    var diffCount = 0
    for i in 0..<str1.count {
        let index1 = str1.index(str1.startIndex, offsetBy: i)
        let index2 = str2.index(str2.startIndex, offsetBy: i)
        if str1[index1] != str2[index2] {
            diffCount += 1
        }
        if diffCount > 1 {
            return false
        }
    }
    return diffCount == 1
}
