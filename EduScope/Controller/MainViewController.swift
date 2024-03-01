//
//  MainViewController.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var schoolData: [SchoolData] = []
    var filterSchoolData: [SchoolData] = []
    var dataManager = DataManager()
    var currentSchoolData: SchoolData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        dataManager.delegate = self
        searchBar.delegate = self
        
        // Set up custom TableViewCell
        tableView.register(UINib(nibName: Constant.cellNibName, bundle: nil), forCellReuseIdentifier: Constant.cellIdentifier)
        
        
        // Get the Data
        dataManager.fetchSchoolData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.detailsSegue {
            if let safeCurrentSchoolData = currentSchoolData {
                let destinationVC = segue.destination as! DetailsViewController
                destinationVC.schoolName = safeCurrentSchoolData.school_name
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBarIsEmpty() {
            return schoolData.count
        } else {
            return filterSchoolData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as! SchoolDataTableViewCell
        if searchBarIsEmpty() {
            cell.nameLabel.text = schoolData[indexPath.row].school_name
            cell.cityLabel.text = schoolData[indexPath.row].city
        } else {
            cell.nameLabel.text = filterSchoolData[indexPath.row].school_name
            cell.cityLabel.text = filterSchoolData[indexPath.row].city
        }
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searchBarIsEmpty() {
            currentSchoolData = schoolData[indexPath.row]
        } else {
            currentSchoolData = filterSchoolData[indexPath.row]
        }
        
        performSegue(withIdentifier: Constant.detailsSegue, sender: self)
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


// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterSchoolData = schoolData.filter({ (schoolData: SchoolData) -> Bool in
            return schoolData.school_name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
}











