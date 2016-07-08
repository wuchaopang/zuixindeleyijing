//
//  delete.swift
//  zuixindeleyijing
//
//  Created by 20141105049 on 16/7/6.
//  Copyright © 2016年 20141105049. All rights reserved.
//

import UIKit
class delete: UIViewController {
    var db:SQLiteDB!
    @IBOutlet weak var text1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,name varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
    }
    @IBAction func shanchu(sender: AnyObject) {
        del()
    }
    func del(){
        let a=text1.text!
        let sql = "delete from t_user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
        }
}
