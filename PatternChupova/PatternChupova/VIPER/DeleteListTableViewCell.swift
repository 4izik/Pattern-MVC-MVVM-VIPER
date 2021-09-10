
import UIKit

class DeleteListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTaskLabel: UILabel!
    @IBOutlet weak var textTaskLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var deadLineLabel: UILabel!
    var id=""
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
