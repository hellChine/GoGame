//
//  GoBoard.swift
//  GoGame
//
//  Created by Zheng on 15/12/31.
//  Copyright © 2015年 Zheng. All rights reserved.
//

import UIKit

class GoBoardView: UIView {
    
    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        let rec = CGContextGetClipBoundingBox(ctx)
        let width = rec.size.width
        let height = rec.size.height
        NSLog("rec : %@", NSStringFromCGRect(rec))
        let backgImage = UIImage(named: "车辆体检背景")
        CGContextTranslateCTM(ctx, 0, rec.height)
        CGContextScaleCTM(ctx, 1.0, -1.0)
        CGContextDrawImage(ctx, rec, backgImage?.CGImage)
        
        CGContextSetRGBStrokeColor(ctx, 100, 0, 100, 1)
        CGContextSetLineWidth(ctx, 0.4)
        CGContextBeginPath(ctx)
        
        let space = width / 20.0
        let oY = height / 2 - (space * 9)
        let dY = height / 2 + (space * 9)
        for(var i = 0; i <= 18; i++ ){
            CGContextMoveToPoint(ctx, (CGFloat(i + 1)) * space, oY )
            CGContextAddLineToPoint(ctx, CGFloat(i + 1) * space, dY)
            CGContextStrokePath(ctx)
        }
        for(var i = 0; i <= 18; i++ ){
            CGContextMoveToPoint(ctx, space, (CGFloat(i)) * space + oY)
            CGContextAddLineToPoint(ctx, width - space, CGFloat(i) * space + oY)
            CGContextStrokePath(ctx)
        }
        
        for(var i = 0; i <= 2; i++){
            for(var j = 0; j <= 2; j++){
                CGContextBeginPath(ctx)
                CGContextAddArc(ctx, (CGFloat(1+3+6*i))*space ,CGFloat(1+3+6*j)*space + oY, 2, 0, CGFloat(2.0*M_PI), 1)
                CGContextStrokePath(ctx)
            }
        }
        
        
    }
    
    
    
}
