
import Foundation

protocol DeleteListPresenterInput{
    var outputPresenter: DeleteListPresenterOutput! {get set}
    var taskDelete:[TaskModel] {get set}
    func takeInteractor()
    
}

protocol DeleteListPresenterOutput {
   
}

class DeleteListPresenter:DeleteListPresenterInput {
    var taskDelete:[TaskModel]=[]
    var outputPresenter: DeleteListPresenterOutput!
    var interactor : DeleteListInteractorInput! = DeleteListInteractor()
    var router: DeleteListRouterInput! = DeleteListRouter()
    
    func takeInteractor() {
        taskDelete=interactor.takeDeleteTask()
        print(taskDelete.count)
    }
}

extension DeleteListPresenter: DeleteListInteractorOutput, DeleteListRouterOutput {
    
}
