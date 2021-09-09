
import UIKit

class DeleteListViewController: UIViewController {
    
    @IBOutlet weak var deleteListTableView: UITableView!
    var presenter: DeleteListPresenterInput! = DeleteListPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.outputPresenter=self
       
    }
    

}
extension DeleteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.taskDelete.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "DeleteListTableViewCell") as! DeleteListTableViewCell
        let task=presenter.taskDelete[indexPath.row]
        cell.nameTaskLabel.text=task.nameTask
        cell.textTaskLabel.text=task.textTask
        cell.deadLineLabel.text=task.deadlineTask
        cell.statusLabel.text=task.status
        return cell
    }
    
    
}
extension DeleteListViewController: DeleteListPresenterOutput {
    
}
