import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class ListViewModel {
    let listModel=ListModel()
    var doWithTask="" {
        didSet {listModel.bindAction(doWithTask: doWithTask, index: selectRow)}
    }
    var selectRow=0
    init () {
        
    }

    func bindOneTask(index:Int)->TaskModel {
        return listModel.getOneTaskActive(index: index)
    }
    func bindTaskNumber() -> Int {
        return listModel.getTaskNumber()
           
    }
    
}

