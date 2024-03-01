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
    var schoolSATData: [SchoolSATData] = []
    var filterSchoolData: [SchoolData] = []
    
    var dataManager = DataManager()
    
    var currentSchoolData: SchoolData?
    var currentSchoolSATData: SchoolSATData?
    
    let search = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        dataManager.delegate = self
        
        // Add Search Delegates and Search Bar to Navigation Item
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        
        // Set up custom TableViewCell
        tableView.register(UINib(nibName: Constant.cellNibName, bundle: nil), forCellReuseIdentifier: Constant.cellIdentifier)
        
        // Get the Data
        dataManager.fetchSchoolData()
        dataManager.fetchSchoolSATData()
    }
    
    // Prepares variables for segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.detailsSegue {
            if let safeCurrentSchoolData = currentSchoolData {
                let destinationVC = segue.destination as! DetailsViewController
                destinationVC.school = safeCurrentSchoolData
                destinationVC.schoolSAT = currentSchoolSATData
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
    
    // Selected Row Delegate.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBarIsEmpty() {
            currentSchoolData = schoolData[indexPath.row]
        } else {
            currentSchoolData = filterSchoolData[indexPath.row]
        }
        
        // Find the Element in the schoolSATData
        currentSchoolSATData = searchCurrentSAT()
        performSegue(withIdentifier: Constant.detailsSegue, sender: self)
    }
    
    // Fucntion to Search for the current SAT Data.
    func searchCurrentSAT() -> SchoolSATData? {
        if let currentSchoolDBN = currentSchoolData?.dbn {
            for element in schoolSATData {
                if element.dbn == currentSchoolDBN {
                    return element
                }
            }
        }
        return nil
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
    
    func didUpdateSATData(_ schoolSATData: [SchoolSATData]) {
        self.schoolSATData = schoolSATData
    }
}


// MARK: - UISearchControllerDelegate
extension MainViewController: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        tableView.reloadData()
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
        return search.searchBar.text?.isEmpty ?? true
    }
}











