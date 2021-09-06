import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class ListViewModel {
    let listModel=ListModel()
    var tasks=[TaskModel]()
    var doWithTask="" {
        didSet {
    bindAction()
    }
    }
    var selectRow=0
    init () {
        
    }
    func bindTask() {
        tasks=listModel.getTask()
    }
    func bindTaskNumber() -> Int {
        return listModel.getTaskNumber()
           
    }
    func bindAction() {
        switch doWithTask {
        case "end":
            tasks[selectRow].status="end"
            print(selectRow)
           
        case "delete":
            tasks[selectRow].status="delete"
           
        case "restore":
            tasks[selectRow].status="active"
        
        default:
            break
        }
    }
    func showPopUp(vc:UIViewController) {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! PopUpViewController
            vc.addChild(popUpVC)
            popUpVC.view.frame = vc.view.frame
            popUpVC.delegate=self
            vc.view.addSubview(popUpVC.view)
            popUpVC.didMove(toParent: vc)
        }
}
extension ListViewModel: PopUpViewControllerDelegate {
    func setAction(action: String) {
        doWithTask=action
    }
}
