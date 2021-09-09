
import Foundation
import RealmSwift
import Realm

protocol DeleteListInteractorInput{
    var outputInteractor: DeleteListInteractorOutput! {get set}
    func takeDeleteTask() -> [TaskModel]
}

protocol DeleteListInteractorOutput {
    
}

class DeleteListInteractor:DeleteListInteractorInput {
    var outputInteractor: DeleteListInteractorOutput!
    func takeDeleteTask() -> [TaskModel] {
        let realm = try! Realm()
        var taskDelete:[TaskModel]=[]
        let allTask=realm.objects(TaskModel.self)
        for task in allTask {
            if task.status != "active" {
                try! taskDelete.append(task) }
        }
        return taskDelete
    }
  
}
