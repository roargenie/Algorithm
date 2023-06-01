//
//  모음사전.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/31.
//

import Foundation

func solution(_ word: String) -> Int {
    let vowels = ["A", "E", "I", "O", "U"]
    var dict = [String: Int]()
    var count = 0
    
    // 모든 길이 5 이하의 단어를 사전에 등록
    func generateDictionary(_ str: String, _ index: Int) {
        if index > 5 {
            return
        }
        
        dict[str] = count
        count += 1
        
        for vowel in vowels {
            generateDictionary(str + vowel, index + 1)
        }
    }
    
    generateDictionary("", 0)
    
    return dict[word] ?? 0
}
