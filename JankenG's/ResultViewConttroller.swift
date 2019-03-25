import UIKit

class ResultViewConttroller: UIViewController {
 
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    
    var userHand: String!
    var result: String = ""
    var number: Int!
    
    override func viewDidLoad() {
        self.title = "結果だよ"

        let comHand = choiceComHand()
        self.comImageView.image = UIImage(named: "com-\(comHand)")
        
        result = judgeResult(userHand: userHand, comHand: comHand)
        resultLabel.text = result
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.performSegue(withIdentifier: "count", sender: number)
    }
    
    func choiceComHand() -> String {
        let choices = ["gu", "choki", "pa"]
        let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
        return choices[randomIndex]
    }
    
    func judgeResult(userHand: String, comHand: String) -> String {

        if userHand == "gu" {
            if comHand == "gu" {
                return "あいこ"
            } else if comHand == "choki" {
                return "勝ち"
            } else if comHand == "pa" {
                return "負け"
            }
        } else if userHand == "choki" {
            if comHand == "gu" {
                return "負け"
            } else if comHand == "choki" {
                return "あいこ"
            } else if comHand == "pa" {
                return "勝ち"
            }
        } else if userHand == "pa" {
            if comHand == "gu" {
                return "勝ち"
            } else if comHand == "choki" {
                return "負け"
            } else if comHand == "pa" {
                return "あいこ"
            }
        }
        return ""
    }

    // 勝ちの場合、numberに1を入れる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ResultViewConttroller = segue.destination as? ViewController {
                if result == "勝ち" {
                    ResultViewConttroller.number = 1
                }
        }
    }
}
