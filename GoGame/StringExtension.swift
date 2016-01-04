//
//  StringWxtension.swift
//  GoGame
//
//  Created by Zheng on 16/1/4.
//  Copyright © 2016年 Zheng. All rights reserved.
//

import Foundation

extension String{
    var asciiValue: UInt32{
        guard let first = characters.first where characters.count == 1 else {return 0}
        return first.unicodeScalarsValue
    }
    func asciiValueAt(pos pos: UInt32) ->UInt32{
        guard characters.count > 0 && Int(pos) < characters.count else {return 0}
        return Array(characters)[Int(pos)].unicodeScalarsValue
    }
    
    func findValueWithTag(beginTag: String, endTag: String) -> String?{
        if let beginLocation = self.rangeOfString(beginTag){
            let startIndex = beginLocation.startIndex
            let rest = self.substringFromIndex(startIndex.advancedBy(beginTag.characters.count))
            if let endRang = rest.rangeOfString(endTag){
                return rest.substringFromIndex(endRang.startIndex)
            }
        }
        return nil
    }
}


extension Character{
    var unicodeScalarsValue: UInt32{
        return (String(self).unicodeScalars.first!.value)
    }
}