//
//  OperateMethod.swift
//  GoGame
//
//  Created by Zheng on 16/1/4.
//  Copyright © 2016年 Zheng. All rights reserved.
//

import Foundation
enum StoneType : Character{
    case Black = "B"
    case Withe = "W"
}

class OperateMethod: NSObject {

}

class Location : NSObject{
    var x : UInt32
    var y : UInt32
    init(x : UInt32 ,y : UInt32) {
        self.x = x
        self.y = y
    }
    func distance() ->UInt32{
        return self.x * self.x + self.y * self.y
    }
}

class Move : NSObject {
    var location : Location
    var type : StoneType
    var isDead: Bool = false
    var groupName = ""
    
    init(type : StoneType, loc : Location) {
        self.location = loc
        self.type = type
    }
    
    init(step : String) {
        let color = StoneType(rawValue: step[step.startIndex])
        let x = step.asciiValueAt(pos: 2) - "a".asciiValue
        let y = step.asciiValueAt(pos: 3) - "a".asciiValue
        
        self.type = color!
        self.location = Location(x: x, y: y)
    }
    
    func isConnectedTo(another: Move) ->Bool{
        if self.type != another.type{
            return false
        }
        let deltaX = abs(Int(self.location.x) - Int(another.location.x))
        let deltaY = abs(Int(self.location.y) - Int(another.location.y))
        return deltaX + deltaY == 1
    }
}
