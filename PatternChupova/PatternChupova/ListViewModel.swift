import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class ListViewModel {
    let listModel=ListModel()
    var doWithTask="" {
        didSet {listModel.bindAction(doWithTask: doWithTask, index: idTask)}
    }
    var idTask=""
    init () {
        
    }

    func bindOneTask(index:Int)->TaskModel {
        return listModel.getOneTaskActive(index: index)
    }
    func bindTaskNumber() -> Int {
        return listModel.getTaskNumber()
           
    }
    
}

