
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
    }
    func getTaskNumber() -> Int {
        takeRealm()
        return realm.objects(TaskModel.self).count
    }
  
    func getOneTaskActive(index:Int)->TaskModel {
        return tasks[index]
    }
    func bindAction(doWithTask:String, index:Int) {
        switch doWithTask {
        case "end":
            reWriteRealm(index: index, newStatus: "end")
            print("end")
        case "delete":
            print("end")
        case "restore":
            print("end")
        default:
            break
        }
    }
    func reWriteRealm(index:Int, newStatus: String) {
        print("reWrite")
        let allTask=realm.objects(TaskModel.self)
        try! realm.write{
            allTask[index].status=newStatus
        }
    }
}
