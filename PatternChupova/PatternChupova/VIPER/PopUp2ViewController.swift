

import UIKit

class PopUp2ViewController: UIViewController {

    @IBOutlet weak var popUp2View: UIView!
    @IBOutlet weak var closePopUp2Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
    @IBAction func closePopUp2(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func endPopUp2(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func deleteTaskPopUp2(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func restoreTaskPopUp2(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}
