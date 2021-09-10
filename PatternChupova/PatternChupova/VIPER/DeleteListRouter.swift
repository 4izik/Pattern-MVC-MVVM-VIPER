
import Foundation
import UIKit
protocol DeleteListRouterInput{
    var outputRouter: DeleteListRouterOutput! {get set}
    func showPopUp2()
}

protocol DeleteListRouterOutput {
    func actionRouter(action:String)
    
}

class DeleteListRouter:DeleteListRouterInput {
    var outputRouter: DeleteListRouterOutput!
    func showPopUp2() {
        let popUp2VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp2") as! PopUp2ViewController
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        var topController = keyWindow?.rootViewController
        while let presentedViewController = topController?.presentedViewController {
                topController = presentedViewController
            }
        topController?.present(popUp2VC, animated: true, completion: nil)
        popUp2VC.modalPresentationStyle = .overCurrentContext
        popUp2VC.delegate=self
        }
    
}

extension DeleteListRouter: PopUp2ViewControllerDelegate {
    func setAction(action: String) {
        outputRouter.actionRouter(action: action)
    }
}
