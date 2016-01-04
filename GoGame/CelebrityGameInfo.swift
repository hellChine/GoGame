//
//  CelebrityGameInfo.swift
//  GoGame
//
//  Created by Zheng on 15/12/31.
//  Copyright © 2015年 Zheng. All rights reserved.
//

import UIKit


class CelebrityGameInfo: NSObject {
    
    var title : String = ""
    var metaInfo : String = ""
    
    var playerWhite: String = ""
    var playerBlack: String = ""
    var rankWhite: String = ""
    var rankBlack: String = ""
    var result: String = ""
    var date:String = ""
    
    var allMoves: [Move] = [Move]()
}

