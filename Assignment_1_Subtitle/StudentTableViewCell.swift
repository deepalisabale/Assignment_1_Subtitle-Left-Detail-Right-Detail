//
//  StudentTableViewCell.swift
//  Assignment_1_Subtitle
//
//  Created by Deepali on 06/03/24.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var textLabel1: UILabel!
    
    @IBOutlet weak var textLabel2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
