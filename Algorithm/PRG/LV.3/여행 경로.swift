

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var graph = [String: [String]]() // 그래프 초기화
    var result = [String]() // 결과 배열 초기화

    // 그래프 구성
    for ticket in tickets {
        let from = ticket[0]
        let to = ticket[1]
        if graph[from] == nil {
            graph[from] = [to]
        } else {
            graph[from]!.append(to)
        }
    }

    // 알파벳 순으로 정렬
    for key in graph.keys {
        graph[key]!.sort()
    }

    // DFS 탐색
    func dfs(_ airport: String) {
        while let destinations = graph[airport], destinations.count > 0 {
            let destination = destinations[0]
            graph[airport]!.removeFirst()
            dfs(destination)
        }
        result.insert(airport, at: 0)
    }

    dfs("ICN")

    return result
}
