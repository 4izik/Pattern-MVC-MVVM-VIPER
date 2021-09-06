import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var optionView: UIView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate=self
        taskTableView.dataSource=self
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        taskTableView.reloadData()
        taskTableView.tableFooterView=UIView()
        viewModel.bindTask()
    }
  
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bindTaskNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        if viewModel.tasks[indexPath.row].status == "active" {
        cell.nameTaskLablel.text=viewModel.tasks[indexPath.row].nameTask
        cell.textTaskLabel.text=viewModel.tasks[indexPath.row].textTask
            cell.deadlineTaskLabel.text=viewModel.tasks[indexPath.row].deadlineTask
            cell.statusLabel.text=viewModel.tasks[indexPath.row].status
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showPopUp(vc: self)
        viewModel.selectRow=indexPath.row
    }
}
