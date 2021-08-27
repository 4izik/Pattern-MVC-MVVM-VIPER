import Foundation
import RealmSwift

class TaskModel:Object {
    @objc dynamic var nameTask=""
    @objc dynamic var textTask=""
    @objc dynamic var dateCreate=""
    @objc dynamic var deadlineTask=""
}
