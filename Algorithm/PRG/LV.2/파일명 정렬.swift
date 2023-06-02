//
//  파일명 정렬.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/01.
//

import Foundation

func solution(_ files: [String]) -> [String] {
    let sortedFiles = files.sorted {
        let file1 = parseFileName($0)
        let file2 = parseFileName($1)
        
        if file1.head.lowercased() == file2.head.lowercased() {
            if file1.number == file2.number {
                return files.firstIndex(of: $0)! < files.firstIndex(of: $1)!
            }
            return file1.number < file2.number
        }
        
        return file1.head.lowercased() < file2.head.lowercased()
    }
    
    return sortedFiles
}

// 파일명을 HEAD, NUMBER, TAIL로 분리하는 함수
func parseFileName(_ fileName: String) -> (head: String, number: Int, tail: String) {
    var head = ""
    var number = ""
    var tail = ""
    
    // HEAD 파트 추출
    var index = fileName.startIndex
    while index < fileName.endIndex {
        let char = fileName[index]
        if char.isNumber {
            break
        }
        head.append(char)
        index = fileName.index(after: index)
    }
    
    // NUMBER 파트 추출
    while index < fileName.endIndex {
        let char = fileName[index]
        if char.isNumber {
            number.append(char)
            if number.count == 5 {
                break
            }
        } else {
            break
        }
        index = fileName.index(after: index)
    }
    
    // TAIL 파트 추출
    tail = String(fileName[index...])
    
    return (head, Int(number) ?? 0, tail)
}
