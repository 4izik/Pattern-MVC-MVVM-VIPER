

import UIKit

class PopUpViewController: UIViewController{

    @IBOutlet weak var closePopUp: UIButton!
    @IBOutlet weak var popUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
  
    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}
