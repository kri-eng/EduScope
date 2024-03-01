//
//  SatScoresTableViewCell.swift
//  EduScope
//
//  Created by Krish Patel on 3/1/24.
//

import UIKit

class SatScoresTableViewCell: UITableViewCell {

    
    @IBOutlet weak var critReadingScore: UILabel!
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
