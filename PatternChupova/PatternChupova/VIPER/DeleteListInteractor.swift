
import Foundation
import RealmSwift
import Realm

protocol DeleteListInteractorInput{
    var outputInteractor: DeleteListInteractorOutput! {get set}
    func takeDeleteTask() -> [TaskModel]
    func reWrite(id:String, newStatus: String)
}

protocol DeleteListInteractorOutput {
    
}

class DeleteListInteractor:DeleteListInteractorInput {
    var outputInteractor: DeleteListInteractorOutput!
    let realm = try! Realm()
    func takeDeleteTask() -> [TaskModel] {
        var taskDelete:[TaskModel]=[]
        let allTask=realm.objects(TaskModel.self)
        for task in allTask {
            if task.status != "active" {
                try! taskDelete.append(task) }
        }
        return taskDelete
    }
    func reWrite(id:String, newStatus: String) {
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
