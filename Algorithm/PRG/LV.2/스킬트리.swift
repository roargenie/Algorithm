//
//  스킬트리.swift
//  Algorithm
//
//  Created by 이명진 on 2023/05/31.
//

import Foundation

func solution(_ skill: String, _ skill_trees: [String]) -> Int {
    var possibleCount = 0
    
    for skillTree in skill_trees {
        var skillIndex = 0
        var isPossible = true
        
        for char in skillTree {
            let currentSkill = String(char)
            
            // 선행 스킬 순서에 포함되는 스킬인 경우
            if skill.contains(currentSkill) {
                // 현재 스킬이 선행 스킬 순서에 맞는지 확인
                if currentSkill != String(skill[skill.index(skill.startIndex, offsetBy: skillIndex)]) {
                    isPossible = false
                    break
                }
                skillIndex += 1
            }
        }
        
        if isPossible {
            possibleCount += 1
        }
    }
    
    return possibleCount
}
