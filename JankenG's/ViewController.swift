import UIKit

var num: Int = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var winCount: UILabel!

    var number: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationbarに表示
        self.title = "じゃんけんをしよう！！"
        // 勝った回数を表示
        num += number ?? 0
        winCount.text = "勝った回数：\(num)"
    }


    @IBAction func onTapGu(_ sender: Any) {
        // 画面遷移先に変数result=guを受け渡す
        self.performSegue(withIdentifier: "result", sender: "gu")
    }

    @IBAction func onTapChoki(_ sender: Any) {
        self.performSegue(withIdentifier: "result", sender: "choki")
    }
    
    @IBAction func onTapPa(_ sender: Any) {
        self.performSegue(withIdentifier: "result", sender: "pa")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            if let rvc = segue.destination as? ResultViewConttroller {
                if let hand = sender as? String {
                    rvc.userHand = hand
                }
            }
        }
    }
}

