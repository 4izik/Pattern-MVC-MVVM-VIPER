
import Foundation

protocol DeleteListPresenterInput{
    var outputPresenter: DeleteListPresenterOutput! {get set}
    var taskDelete:[TaskModel] {get set}
    func takeInteractor()
    func goRouter(id:String)
    
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
    }
    func goRouter(id: String) {
        router.showPopUp2()
        
    }
}

extension DeleteListPresenter: DeleteListInteractorOutput, DeleteListRouterOutput {
    
}
