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
        bind()
    }
    
    func bind() {
    /*    viewModel.taskRx.bind(to: taskTableView.rx
                                    .items(cellIdentifier: "TaskTableViewCell", cellType: TaskTableViewCell.self)) {row, task, cell in
            cell.nameTaskLablel.text="\(task.nameTask)"
            cell.textTaskLabel.text="\(task.textTask)"
            cell.deadlineTaskLabel.text="\(task.deadlineTask)"
            }
      */
    }
  
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bindTask()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.nameTaskLablel.text=viewModel.tasks[indexPath.row].nameTask
        cell.textTaskLabel.text=viewModel.tasks[indexPath.row].textTask
        cell.deadlineTaskLabel.text=viewModel.tasks[indexPath.row].deadlineTask
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showPopUp(vc: self)
    }
}
