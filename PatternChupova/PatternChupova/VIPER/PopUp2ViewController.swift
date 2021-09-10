

import UIKit
protocol PopUp2ViewControllerDelegate {
    func setAction(action:String)
}

class PopUp2ViewController: UIViewController {

    @IBOutlet weak var popUp2View: UIView!
    @IBOutlet weak var closePopUp2Button: UIButton!
    var delegate:PopUp2ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
    
    @IBAction func closePopUp2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func endPopUp2(_ sender: Any) {
        delegate?.setAction(action: "end")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteTaskPopUp2(_ sender: Any) {
        delegate?.setAction(action: "delete")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func restoreTaskPopUp2(_ sender: Any) {
        delegate?.setAction(action: "restore")
        dismiss(animated: true, completion: nil)
    }
    
}
