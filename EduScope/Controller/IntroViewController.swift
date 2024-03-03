//
//  ViewController.swift
//  EduScope
//
//  Created by Krish Patel on 2/28/24.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var serviceAPICount = 0
    var dataManager = DataManager()
    
    var schoolData: [SchoolData] = []
    var schoolSATData: [SchoolSATData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Hdie the activity Indicator.
        activityIndicator.alpha = 0
        
        // Generate the Animation.
        generateAnimation()
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        // Acitivity indicator starts and hidden to false.
        activityIndicator.alpha = 1
        activityIndicator.startAnimating()
        
        // Get the Data
        dataManager.fetchSchoolData(completionHandler: { schoolData in
            self.schoolData = schoolData
            DispatchQueue.main.async {
                self.serviceAPICount += 1
                self.loadSchoolTableView()
            }
        })
        dataManager.fetchSchoolSATData(completionHandler: { schoolSATData in
            self.schoolSATData = schoolSATData
            DispatchQueue.main.async {
                self.serviceAPICount += 1
                self.loadSchoolTableView()
            }
        })
        
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.mainSegue {
            let destinationVC = segue.destination as! MainViewController
            destinationVC.schoolData = self.schoolData
            destinationVC.schoolSATData = self.schoolSATData
        }
    }
    
    //
    func loadSchoolTableView() {
        if serviceAPICount == 2 {
            activityIndicator.stopAnimating()
            activityIndicator.alpha = 0
            performSegue(withIdentifier: Constant.mainSegue, sender: self)
            serviceAPICount = 0
        }
    }
    
    // MARK: - Animation Functions
    func generateAnimation() {
        searchButton.alpha = 0.0
        generateTextAnimation()
    }
    
    func generateTextAnimation() {
        appNameLabel.text = ""
        let title = Constant.appName
        var charIndex = 0.0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.15 * charIndex, repeats: false) { timer in
                self.appNameLabel.text?.append(letter)
                if letter == Constant.appName.last {
                    self.searchButtonFadeOutTransition()
                }
            }
            charIndex += 1
        }
    }
    
    func searchButtonFadeOutTransition() {
        UIView.transition(with: self.searchButton, duration: 0.75, options: .transitionCrossDissolve) {
            self.searchButton.alpha = 1.0
        }
    }

}

