//
//  DetailsViewController.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import UIKit

class DetailsViewController: UIViewController {

    var schoolName: String?
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // Add Content to Each Field
        schoolNameLabel.text = schoolName!
    }
    

}








/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
