
import Foundation
import UIKit
protocol DeleteListRouterInput{
    var outputRouter: DeleteListRouterOutput! {get set}
    func showPopUp2()
}

protocol DeleteListRouterOutput {
    
}

class DeleteListRouter:DeleteListRouterInput {
    var outputRouter: DeleteListRouterOutput!
    func showPopUp2() {
        print("go")
        let vc=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "deleteVC") as! DeleteListViewController
        let popUp2VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp2") as! PopUp2ViewController
        vc.addChild(popUp2VC)
        popUp2VC.view.frame = vc.view.frame
        vc.view.addSubview(popUp2VC.view)
        popUp2VC.didMove(toParent: vc)
    }
}

