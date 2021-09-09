import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var nameTaskTextField: UITextField!
    @IBOutlet weak var textTaskTextfield: UITextView!
    @IBOutlet weak var dateCreateTextField: UITextField!
    @IBOutlet weak var deadlineTextField: UITextField!
    @IBOutlet weak var addTaskButton: UIButton!
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        textTaskTextfield.delegate=self
        textTaskTextfield.textColor=UIColor.lightGray
        textTaskTextfield.text="Описание задачи"
        nameTaskTextField.delegate=self
        dateCreateTextField.delegate=self
        deadlineTextField.delegate=self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    @IBAction func addTask(_ sender: Any) {
        let task=TaskModel()
        if let name=nameTaskTextField.text {task.nameTask=name}
        if let text=textTaskTextfield.text {task.textTask=text}
        if let dateCreate=dateCreateTextField.text {task.dateCreate=dateCreate}
        if let deadline=deadlineTextField.text {task.deadlineTask=deadline}
        let uuid = UUID().uuidString
        task.id=uuid
        task.status="active"
        saveInRealm(task: task)
    }
    func saveInRealm (task: TaskModel) {
        try! realm.write{
            realm.add(task)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
  
}
extension ViewController:UITextViewDelegate, UITextFieldDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "Описание задачи" && textView.textColor == .lightGray)
           {
               textView.text = ""
               textView.textColor = .black
           }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "")
            {
                textView.text = "Описание задачи"
                textView.textColor = .lightGray
            }
    }
}
