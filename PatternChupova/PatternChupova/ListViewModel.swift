import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class ListViewModel {
    //let taskRx=BehaviorSubject<[TaskModel]> (value: [])
    var tasks=[TaskModel]()
    let realm = try! Realm()
    init () {
        takeRealm()
    }
   private func takeRealm() {
        let allTask=realm.objects(TaskModel.self)
        
        for task in allTask {
            try! tasks.append(task)
            //taskRx.onNext([task] + taskRx.value())
        }
    }
    func bindTask() -> Int {
        return realm.objects(TaskModel.self).count
    }
    func showPopUp(vc:UIViewController) {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! PopUpViewController
            vc.addChild(popUpVC)
            popUpVC.view.frame = vc.view.frame
            vc.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: vc)
        }
}
