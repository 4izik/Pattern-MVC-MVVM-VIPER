

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTaskLablel: UILabel!
    @IBOutlet weak var textTaskLabel: UILabel!
    @IBOutlet weak var deadlineTaskLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
