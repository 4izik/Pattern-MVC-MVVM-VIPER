
import Foundation

protocol DeleteListPresenterInput{
    var outputPresenter: DeleteListPresenterOutput! {get set}
    var taskDelete:[TaskModel] {get set}
    func takeInteractor()
    func goRouter(id:String)
    
}

protocol DeleteListPresenterOutput {
   func reloadTable()
}

class DeleteListPresenter:DeleteListPresenterInput {
   
    var taskDelete:[TaskModel]=[]
    var doWithTask="" {
        didSet {
            switch doWithTask {
            case "restore":
                interactor.reWrite(id: idTask, newStatus: "active")
            case "end":
                interactor.reWrite(id: idTask, newStatus: "end")
            case "delete":
                interactor.reWrite(id: idTask, newStatus: "delete")
            default: break
            }
            outputPresenter.reloadTable()
        }
    }
    var idTask=""
    var outputPresenter: DeleteListPresenterOutput!
    var interactor : DeleteListInteractorInput! = DeleteListInteractor()
    var router: DeleteListRouterInput! = DeleteListRouter()
    
    func takeInteractor() {
        taskDelete=interactor.takeDeleteTask()
    }
    func goRouter(id: String) {
        router.showPopUp2()
        router.outputRouter=self
        idTask=id
    }
}

extension DeleteListPresenter: DeleteListInteractorOutput, DeleteListRouterOutput {
    func actionRouter(action: String) {
        doWithTask=action
    }

}
