

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var students: Set = Set(Array(1...n))
    var lostStudents: Set = Set(lost)
    var reserveStudents: Set = Set(reserve)
    
    // Copy On Wirte
    var students1: Set = students
    var lostStudents1: Set = lostStudents
    var reserveStudents1: Set = reserveStudents
    
    if !lostStudents.intersection(reserveStudents).isEmpty {
        for i in lostStudents.intersection(reserveStudents) {
            lostStudents.remove(i)
            reserveStudents.remove(i)
        }
        for j in lostStudents {
            students.remove(j)
        }
    } else {
        for i in lostStudents {
            students.remove(i)
        }
    }
    
    if !lostStudents1.intersection(reserveStudents1).isEmpty {
        for i in lostStudents1.intersection(reserveStudents1) {
            lostStudents1.remove(i)
            reserveStudents1.remove(i)
        }
        for j in lostStudents1 {
            students1.remove(j)
        }
    } else {
        for i in lostStudents1 {
            students1.remove(i)
        }
    }
    
    while !lostStudents.isEmpty {
        for i in lostStudents.sorted(by: <) {
            if reserveStudents.contains(i + 1) {
                students.update(with: i)
                lostStudents.remove(i)
                reserveStudents.remove(i + 1)
            } else if reserveStudents.contains(i - 1) {
                students.update(with: i)
                lostStudents.remove(i)
                reserveStudents.remove(i - 1)
            } else if !reserveStudents.contains(i + 1) {
                lostStudents.remove(i)
                reserveStudents.remove(i + 1)
            } else if !reserveStudents.contains(i - 1) {
                lostStudents.remove(i)
                reserveStudents.remove(i - 1)
            }
        }
    }
    
    while !lostStudents1.isEmpty {
        for i in lostStudents1.sorted(by: >) {
            if reserveStudents1.contains(i + 1) {
                students1.update(with: i)
                lostStudents1.remove(i)
                reserveStudents1.remove(i + 1)
            } else if reserveStudents1.contains(i - 1) {
                students1.update(with: i)
                lostStudents1.remove(i)
                reserveStudents1.remove(i - 1)
            } else if !reserveStudents1.contains(i + 1) {
                lostStudents1.remove(i)
                reserveStudents1.remove(i + 1)
            } else if !reserveStudents1.contains(i - 1) {
                lostStudents1.remove(i)
                reserveStudents1.remove(i - 1)
            }
        }
    }
    
    return max(students.count, students1.count)
}

//MARK: - 더 나은 풀이

func solution1(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    let newReserve = reserve.filter { !lost.contains($0) }
    let newLost = lost.filter { !reserve.contains($0) }

    var lostPeople: Int = newLost.count

    newReserve.forEach {
        let isLend: Bool = newLost.contains($0 - 1) || newLost.contains($0 + 1)
        if isLend && lostPeople > 0 {
            lostPeople -= 1
        }
    }

    return n - lostPeople
}
