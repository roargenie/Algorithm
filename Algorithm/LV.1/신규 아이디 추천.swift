
import Foundation

func solution(_ new_id:String) -> String {
    var newId = new_id
        .lowercased()
        .replacingOccurrences(of: #"[^\w.-]"#, with: "", options: .regularExpression)
        .replacingOccurrences(of: #"\.{2,}"#, with: ".", options: .regularExpression)
        .trimmingCharacters(in: CharacterSet(charactersIn: "."))
    newId = newId.isEmpty ? "a" : newId
    if newId.count > 15 {
        newId = String(newId.prefix(15)).trimmingCharacters(in: CharacterSet(charactersIn: "."))
    }
    if newId.count <= 2 {
        newId = newId.padding(toLength: 3, withPad: String(newId.suffix(1)), startingAt: 0)
    }

    return newId
}
