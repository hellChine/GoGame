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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.purpleColor()
        
        goBoard.frame = CGRectMake(10, 20, KcontrolWidth - 20 , KcontrolHeight - 40)
        self.view.addSubview(goBoard)
        
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
