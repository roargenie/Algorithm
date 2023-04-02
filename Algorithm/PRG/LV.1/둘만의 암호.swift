

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var aAscii = Int(UnicodeScalar("a").value)
    var zAscii = Int(UnicodeScalar("z").value)
    
    // skip 문자들 아스키로 바꿔두기
    var skipAscii = skip.map { Int(UnicodeScalar(String($0))!.value)  }
    
    // 정답 문자열
    var answer = ""
    
    for v in s {
        // 현재 문자의 아스키코드
        var ascii = Int(UnicodeScalar(String(v))!.value)
        // index만큼 더했는지 확인하는 변수
        var indexCnt = 0
        
        // 아스키코드를 1씩 더하는 loop
        while indexCnt < index {
            ascii += 1

            // z아스키 넘었는지 체크
            if ascii > zAscii {
                ascii = aAscii
            }
            
            // 건너뛰어야하는 문자열이면 indexCnt 증가 X
            if skipAscii.contains(ascii) {
                continue
            } else {
                indexCnt += 1
            }
            
        }
        
        // 다시 문자열로 변환해서 append
        answer.append(String(UnicodeScalar(ascii)!))
    }

    return answer
}
