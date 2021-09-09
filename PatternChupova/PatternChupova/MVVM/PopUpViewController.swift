

import UIKit
protocol PopUpViewControllerDelegate {
    func setAction(action:String)
}
class PopUpViewController: UIViewController{
    
    @IBOutlet weak var closePopUp: UIButton!
    @IBOutlet weak var popUpView: UIView!
    var delegate:PopUpViewControllerDelegate?
    var doWithTask=""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
  
    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
        delegate?.setAction(action: doWithTask)

    }
    @IBAction func endTask(_ sender: Any) {
        doWithTask="end"
        self.view.removeFromSuperview()
        delegate?.setAction(action: doWithTask)
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        doWithTask="delete"
        self.view.removeFromSuperview()
        delegate?.setAction(action: doWithTask)
    }
    @IBAction func restoreTask(_ sender: Any) {
        doWithTask="restore"
        self.view.removeFromSuperview()
        delegate?.setAction(action: doWithTask)
    }
}
