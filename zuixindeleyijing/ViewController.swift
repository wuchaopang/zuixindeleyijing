import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func save(sender: AnyObject) {
        saveUser()
    }
    var db:SQLiteDB!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
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
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            name.text = user["uname"] as? String
            phone.text = user["mobile"] as? String
            email.text = user["email"] as? String
            address.text = user["address"] as? String


        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    func saveUser() {
        let name = self.name.text!
        let phone = self.phone .text!
         let email = self.email .text!
         let address = self.address .text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile,email,address) values('\(name)','\(phone)','\(email)','\(address)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
}

