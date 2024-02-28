//
//  MainViewController.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var schoolData: [SchoolData] = []
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        dataManager.delegate = self
        
        // Get the Data
        dataManager.fetchSchoolData()
    }
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
        cell.textLabel?.text = schoolData[indexPath.row].school_name
        return cell
    }
    
}

// MARK: - DataManagerDelegate
extension MainViewController: DataManagerDelegate {
    func didUpdateData(_ schoolData: [SchoolData]) {
        self.schoolData = schoolData
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
