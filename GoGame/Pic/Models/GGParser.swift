//
//  GGParser.swift
//  GoGame
//
//  Created by Zheng on 16/1/4.
//  Copyright © 2016年 Zheng. All rights reserved.
//

import Foundation

public class GGParser{
    
    func parse(kifu: String)->CelebrityGameInfo{
        let game = CelebrityGameInfo()
        let nodes = kifu.characters.split { $0 == ";"}
        .map(String.init)
        
        if nodes.count >= 2{
            let metaNode = nodes[1]
            if let pb = metaNode.findValueWithTag("PB[", endTag: "]"){
                game.playerBlack = pb
            }
            if let pw = metaNode.findValueWithTag("PW[", endTag: "]"){
                game.playerWhite = pw
            }
            if let br = metaNode.findValueWithTag("BR[", endTag: "]"){
                game.rankBlack = br
            }
            if let wr = metaNode.findValueWithTag("WR[", endTag: "]"){
                game.rankWhite = wr
            }
            if let re = metaNode.findValueWithTag("RE[", endTag: "]"){
                game.result = re
            }
            if let dt = metaNode.findValueWithTag("DT[", endTag: "]"){
                game.date = dt
            }
        }
        let moves = nodes
            .filter{($0.hasPrefix("B[")||$0.hasPrefix("W[")) && $0.characters.count >= 4 && $0[$0.startIndex.advancedBy(4)] == "]"}
            .map{Move(step: $0 as String)}
        game.allMoves = moves
        return game
    }
    
    
}
