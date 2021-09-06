
import Foundation
import RealmSwift

class ListModel {
    var tasks=[TaskModel]()
    let realm = try! Realm()
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
    func getTaskNumber() -> Int {
        takeRealm()
        return realm.objects(TaskModel.self).count
    }
    func getTask() -> [TaskModel] {
        return tasks
    }
}
