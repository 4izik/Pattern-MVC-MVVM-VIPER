
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
        let popUp2VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp2") as! PopUp2ViewController
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        var topController = keyWindow?.rootViewController
        while let presentedViewController = topController?.presentedViewController {
                topController = presentedViewController
            }
        
        topController?.present(popUp2VC, animated: true, completion: nil)
        //topController.addChild(popUp2VC)
        popUp2VC.view.frame = (topController?.view.frame)!
        topController?.view.addSubview(popUp2VC.view)
        }
        
       // let popUp2VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp2") as! PopUp2ViewController
        
    
}

