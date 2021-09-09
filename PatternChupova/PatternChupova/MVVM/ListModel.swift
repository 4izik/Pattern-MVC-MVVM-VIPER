
import Foundation
import RealmSwift

class ListModel {
    var tasks=[TaskModel]()
    var tasksActive=[TaskModel]()
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
        tasksActive=tasks.filter{$0.status=="active"}
    }
    func getTaskNumber() -> Int {
        takeRealm()
        tasksActive=tasks.filter{$0.status=="active"}
        return realm.objects(TaskModel.self).filter{$0.status=="active"}.count
    }
  
    func getOneTaskActive(index:Int)->TaskModel {
        return tasksActive[index]
    }
    func bindAction(doWithTask:String, index:String) {
        
        switch doWithTask {
        case "end":
            reWriteRealm(id: index, newStatus: "end")
        case "delete":
            reWriteRealm(id: index, newStatus: "delete")
        case "restore":
            reWriteRealm(id: index, newStatus: "active")
        default:
            break
        }
    }
    func reWriteRealm(id:String, newStatus: String) {
        let allTask=realm.objects(TaskModel.self)
        for task in allTask {
            if task.id==id {
                try! realm.write{
                    task.status=newStatus
                }
            }
        }
        
    }
}
