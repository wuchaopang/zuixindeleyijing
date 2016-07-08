import UIKit
class danyichazhao: UIViewController {
    @IBAction func cahzhaoname(sender: AnyObject) {
        danyi()
        
    }
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var text1: UITextField!
    
    
    var db:SQLiteDB!
    func danyi()
    {
        text2.text=""
        let a=text1.text!
        let data = db.query("select * from t_user where uname='\(a)'")
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text2.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!)+"邮箱：" + String(tuser["email"]!)+"地址：" + String(tuser["address"]!)+"\n"
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        //initUser()
        
    }
    
    //从SQLite加载数据
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
