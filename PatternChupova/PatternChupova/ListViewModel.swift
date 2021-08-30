import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class ListViewModel {
    let nameTask=BehaviorSubject<[String]> (value: [])
    let textTask=BehaviorSubject<[String]> (value: [])
    let deadlineTask=BehaviorSubject<[String]> (value: [])
    let dataCreateTask=BehaviorSubject<[String]> (value: [])
    let realm = try! Realm()
    init () {
        takeRealm()
        bind()
    }
    private func takeRealm() {
        let allTask=realm.objects(TaskModel.self)
        print(allTask.count)
        for task in allTask {
            nameTask.onNext([task.nameTask])
            textTask.onNext([task.textTask])
            deadlineTask.onNext([task.deadlineTask])
            dataCreateTask.onNext([task.dateCreate])
        }
    }
    private func bind() {
       
    }
}
