//
//  DetailsViewController.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var school: SchoolData?
    var schoolSAT: SchoolSATData?
    var numOfSections: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set data sources.
        detailsTableView.dataSource = self
        
        // Set up custom TableViewCell.
        detailsTableView.register(UINib(nibName: Constant.topInfoCellNibName, bundle: nil), forCellReuseIdentifier: Constant.topInfoCellIdentifier)
        detailsTableView.register(UINib(nibName: Constant.overviewCellNibName, bundle: nil), forCellReuseIdentifier: Constant.overviewCellIdentifier)
        detailsTableView.register(UINib(nibName: Constant.satScoresCellNibName, bundle: nil), forCellReuseIdentifier: Constant.satScoresCellIdentifier)
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: Constant.topInfoCellIdentifier, for: indexPath) as! TopInfoTableViewCell
            
            if let safeSchool = school {
                cell.schoolNameLabel.text = safeSchool.school_name
                cell.cityLabel.text = safeSchool.city
                cell.phoneNumber = safeSchool.phone_number
            }
            
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: Constant.overviewCellIdentifier, for: indexPath) as! OverviewTableViewCell
            
            if let overview = school?.overview_paragraph {
                cell.overviewLabel.text = overview
            } else {
                cell.overviewLabel.text = "N/A"
            }
            
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: Constant.satScoresCellIdentifier, for: indexPath) as! SatScoresTableViewCell
            
            if let safeSchoolSAT = schoolSAT {
                cell.critReadingScore.text = "Avg. Critical Reading Score: \(safeSchoolSAT.sat_critical_reading_avg_score)"
                cell.mathScore.text = "Avg. Math Score: \(safeSchoolSAT.sat_math_avg_score)"
                cell.writingScore.text = "Avg. Writing Score: \(safeSchoolSAT.sat_writing_avg_score)"
            } else {
                cell.critReadingScore.text = "Avg. Critical Reading Score: N/A"
                cell.mathScore.text = "Avg. Math Score: N/A"
                cell.writingScore.text = "Avg. Writing Score: N/A"
            }
            
            cell.selectionStyle = .none
            return cell
        }
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
