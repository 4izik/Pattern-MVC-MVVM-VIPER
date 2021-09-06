import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class ListViewModel {
    //let taskRx=BehaviorSubject<[TaskModel]> (value: [])
    var tasks=[TaskModel]()
    var endTask=[TaskModel]()
    let realm = try! Realm()
    var doWithTask=""
    var selectRow=0
    init () {
        takeRealm()
    }
   private func takeRealm() {
        tasks=[]
        let allTask=realm.objects(TaskModel.self)
        for task in allTask {
            try! tasks.append(task)
        }
    }
    func bindTask() -> Int {
        takeRealm()
        return realm.objects(TaskModel.self).count
    }
    func bindAction() {
        switch doWithTask {
        case "end":
            endTask.append(tasks[selectRow])
            tasks.remove(at: selectRow)
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
