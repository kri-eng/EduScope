//
//  TopInfoTableViewCell.swift
//  EduScope
//
//  Created by Krish Patel on 3/1/24.
//

import UIKit

protocol TopInfoTableViewCellDelegate {
    func mapButtonPressed()
    func webButtonPressed()
    func phoneButtonPressed()
}

class TopInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var topInfoView: UIView!
    
    var delegate: TopInfoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // topInfoView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func phonePressed(_ sender: UIButton) {
        self.delegate?.phoneButtonPressed()
    }
    
    @IBAction func mapPressed(_ sender: UIButton) {
        self.delegate?.mapButtonPressed()
    }
    
    @IBAction func webPressed(_ sender: UIButton) {
        self.delegate?.webButtonPressed()
    }
    
    // Function to format the phoneNumber
    func formatPhoneNumber(phoneNumber: String) -> String {
        let allowedCharacters = Set("0123456789")
        return phoneNumber.filter { allowedCharacters.contains($0) }
    }
    
}
