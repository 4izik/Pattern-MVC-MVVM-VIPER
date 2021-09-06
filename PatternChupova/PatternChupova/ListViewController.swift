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
   
    }
    override func viewWillAppear(_ animated: Bool) {
        taskTableView.reloadData()
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
        viewModel.selectRow=indexPath.row
    }
}
