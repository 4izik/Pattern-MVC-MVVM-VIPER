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
    }
    func showPopUp() {
            let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! PopUpViewController
            addChild(popUpVC)
            popUpVC.view.frame = view.frame
            popUpVC.delegate=self
            view.addSubview(popUpVC.view)
            popUpVC.didMove(toParent: self)
        }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bindTaskNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let oneTask=viewModel.bindOneTask(index: indexPath.row)
        if oneTask.status == "active" {
        cell.nameTaskLablel.text=oneTask.nameTask
        cell.textTaskLabel.text=oneTask.textTask
            cell.deadlineTaskLabel.text=oneTask.deadlineTask
            cell.statusLabel.text=oneTask.status
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       showPopUp()
        viewModel.selectRow=indexPath.row
    }
}
extension ListViewController: PopUpViewControllerDelegate {
    func setAction(action: String) {
        viewModel.doWithTask=action
      
    }
}
