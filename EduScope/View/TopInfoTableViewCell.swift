//
//  TopInfoTableViewCell.swift
//  EduScope
//
//  Created by Krish Patel on 3/1/24.
//

import UIKit

class TopInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var topInfoView: UIView!
    
    var phoneNumber: String?
    var websiteURL: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topInfoView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func phonePressed(_ sender: UIButton) {
        if let safePhoneNumber = phoneNumber {
            let formatedPhoneNumber = formatPhoneNumber(phoneNumber: safePhoneNumber)
            if let phoneCallURL = URL(string: "tel://\(formatedPhoneNumber)") {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    // Function to format the phoneNumber
    func formatPhoneNumber(phoneNumber: String) -> String {
        let allowedCharacters = Set("0123456789")
        return phoneNumber.filter { allowedCharacters.contains($0) }
    }
    
}
