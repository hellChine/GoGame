//
//  GameViewController.swift
//  GoGame
//
//  Created by Zheng on 15/12/31.
//  Copyright © 2015年 Zheng. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var goBoard = GoBoardView()
    var _game: CelebrityGameInfo = CelebrityGameInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.purpleColor()
        
        goBoard.frame = CGRectMake(10, 20, KcontrolWidth - 20 , KcontrolHeight - 40)
        self.view.addSubview(goBoard)
        
        if let filePath = NSBundle.mainBundle().pathForResource("001", ofType: "sgf"){
            do{
                let kifu = try NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
                _game = GGParser().parse(kifu as String)
                showMoves()
            }
            catch{}
        }
        
    }
    
    func showMoves(){
        if _game.allMoves.count > 0 {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
