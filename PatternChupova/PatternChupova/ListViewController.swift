import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        viewModel.nameTask.bind(to: taskTableView.rx
                                    .items(cellIdentifier: "TaskTableViewCell", cellType: TaskTableViewCell.self)) {row, name, cell in
              
            cell.nameTaskLablel.text="\(name)"
            }
          
    }

}
