//
//  방곡 그 곡.swift
//  Algorithm
//
//  Created by 이명진 on 2023/06/12.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = "(None)"
    var maxDiff = -1
    let newMusicNote = removeSharpSymbol(m)
    let dividedMusicInfo = divideMusicInfos(musicinfos)
    
    for music in dividedMusicInfo {
        let musicTitle = music[2]
        let timeDiff = makeTimeDiff(music[0], music[1])
        let runingNote = playingMusicNote(timeDiff, music[3])
        
        if runingNote.contains(newMusicNote) {
            if maxDiff < timeDiff {
                maxDiff = timeDiff
                result = musicTitle
            }
        }
    }
    
    return result
}

func makeTimeDiff(_ startTime: String, _ endTime: String) -> Int {
    
    let start = startTime.split(separator: ":").map { Int(String($0))! }
    let end = endTime.split(separator: ":").map { Int(String($0))! }
    
    return (end[0] * 60 + end[1]) - (start[0] * 60 + start[1])
}

func playingMusicNote(_ timeDiff: Int, _ musicNote: String) -> String {
    
    var playingNote = ""
    let musicCode = removeSharpSymbol(musicNote).map { String($0) }
    
    for i in 0..<timeDiff {
        playingNote += musicCode[i % musicCode.count]
    }
    return playingNote
}

func divideMusicInfos(_ musicInfo: [String]) -> [[String]] {
    
    var newMusicInfo = [[String]]()
    
    for i in 0..<musicInfo.count {
        let music = musicInfo[i].split(separator: ",").map { String($0) }
        newMusicInfo.append(music)
    }
    
    return newMusicInfo
}

func removeSharpSymbol(_ str: String) -> String {
    
    let musicNote = str
        .replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    
    return musicNote
}
