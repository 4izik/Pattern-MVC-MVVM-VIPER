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
        bind()
    }
    
    func bind() {
        viewModel.taskRx.bind(to: taskTableView.rx
                                    .items(cellIdentifier: "TaskTableViewCell", cellType: TaskTableViewCell.self)) {row, task, cell in
            cell.nameTaskLablel.text="\(task.nameTask)"
            cell.textTaskLabel.text="\(task.textTask)"
            cell.deadlineTaskLabel.text="\(task.deadlineTask)"
            }
      
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showPopUp(vc: self)
    }
}
