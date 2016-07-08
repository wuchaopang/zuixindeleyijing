//
//  find.swift
//  zuixindeleyijing
//
//  Created by 20141105049 on 16/7/6.
//  Copyright © 2016年 20141105049. All rights reserved.
//

import UIKit

class find: UIViewController {
    @IBAction func chazhao(sender: AnyObject) {
        selete()
    }
    @IBOutlet weak var text: UITextView!
    var db:SQLiteDB!
    override func viewDidLoad() {
    super.viewDidLoad()
    //获取数据库实例
    db = SQLiteDB.sharedInstance()
    //如果表还不存在则创建表（其中uid为自增主键）
    db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        //如果有数据则加载
        //initUser()
        
    }

    
    func selete(){
        let data = db.query("select * from t_user")
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!)
        }
        
    }
      
    
   }
