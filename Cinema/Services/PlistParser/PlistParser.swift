//
//  PlistParser.swift
//  Cinema
//
//  Created by AlexanderKogut on 4/8/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation

class PlistParser {
    
    enum PlistFileName: String{
        case ApiKey
    }
    
    enum PlistKey: String {
        case omdbapi
    }
    
    func getValue(plistName: PlistFileName, key: PlistKey) -> String {
        let plistDictionary = getDictionaryFrom(plistName: PlistFileName.ApiKey.rawValue)
        if let value = plistDictionary.value(forKey: key.rawValue) as? String {
            return value
        }
        return ""
    }
    
    private func getDictionaryFrom(plistName: String) -> NSDictionary {
        var dictonary: NSDictionary = [:]
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) {
                dictonary = dic
            }
        }
        return dictonary
    }
}
