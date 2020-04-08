//
//  Logger.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation

class Logger {
    
    static func Log(_ debug: String = "" , fileName: String = #file, function: String =  #function, line: Int = #line) {
        let time = Date()
        let file = URL(fileURLWithPath: fileName).lastPathComponent
        print("┌──────────────┬───────────────────────────────────────────────────────────────")
        print("│ Debbug \(time) \(file) │ line: \(line) \(function) \(debug)")
        print("└──────────────┴───────────────────────────────────────────────────────────────")
    }
}
