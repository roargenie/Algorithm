

import Foundation

func solution(_ phone_number:String) -> String {
    var phoneNumber = phone_number.map { String($0) }
    return String(repeating: "*", count: phoneNumber.count - 4) + phoneNumber[phoneNumber.endIndex - 4...phoneNumber.endIndex - 1].joined()
}

//MARK: - 더 나은 풀이

func solution1(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}

