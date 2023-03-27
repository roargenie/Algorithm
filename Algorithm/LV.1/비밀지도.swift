

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var arr1Binary = [Int]()
    var arr2Binary = [Int]()
    var unionBinary = [String]()
    var graph: [[String]] = Array(repeating: [], count: n)
    var answer: [String] = []
    
    for i in arr1 {
        arr1Binary.append(Int(String(i, radix: 2))!)
    }
    
    for i in arr2 {
        arr2Binary.append(Int(String(i, radix: 2))!)
    }
    for j in 0..<n {
        unionBinary.append(String(arr1Binary[j] + arr2Binary[j]))
    }
    
    for (index, num) in unionBinary.enumerated() {
        if num.count == n {
            num.forEach {
                if $0 >= "1" {
                    graph[index].append("#")
                } else {
                    graph[index].append(" ")
                }
            }
        } else {
            graph[index].append(contentsOf: Array(repeating: " ", count: n - num.count))
            num.forEach {
                if $0 >= "1" {
                    graph[index].append("#")
                } else {
                    graph[index].append(" ")
                }
            }
        }
    }
    
    for str in graph {
        answer.append(str.joined())
    }
    return answer
}

//MARK: - 더 나은 풀이

func solution1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map { String(String(arr1[$0]|arr2[$0]|2<<(n - 1), radix: 2).map { $0 == "1" ? "#" : " " }[1...n]) }
}

func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {

    return (0..<n).map {
        let binary = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n - binary.count) + binary
        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}
