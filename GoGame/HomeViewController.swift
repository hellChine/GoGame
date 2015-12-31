//
//  ViewController.swift
//  GoGame
//
//  Created by Zheng on 15/12/31.
//  Copyright © 2015年 Zheng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var _games:[CelebrityGameInfo] = [CelebrityGameInfo]()
    var _tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "知名棋谱"
        let game1 = CelebrityGameInfo()
        game1.title = "第一届日本最强者决定战吴清源对高川格"
        game1.metaInfo = "对弈时间：1957年2月20日"
        _games.append(game1)
        
        let game2 = CelebrityGameInfo()
        game2.title = "MarkNote对弈李昌镐"
        game2.metaInfo = "对弈时间：2015年12月28日"
        _games.append(game2)
        
        self.initTableView()
    }
    
    func initTableView(){
        _tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.rowHeight = 60.0
        _tableView.separatorColor = UIColor.redColor()
        self.view.addSubview(_tableView)
        
        let cell =  UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: NSStringFromClass(_tableView.classForCoder))
        _tableView.registerClass(cell.classForCoder, forCellReuseIdentifier: NSStringFromClass(_tableView.classForCoder))

    }

    @objc internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let game = _games[row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(_tableView.classForCoder), forIndexPath: indexPath)

        cell.textLabel?.text = game.title
        cell.detailTextLabel?.text = game.metaInfo
        
        return cell
    }
    @objc internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _games.count
    }
    @objc internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let game = _games[indexPath.row]
        let gameVC = GameViewController()
        gameVC.title = game.title
        self.navigationController?.pushViewController(gameVC, animated: true)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

