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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Generate the Animation.
        generateAnimation()
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        // Perform the Segue
        performSegue(withIdentifier: Constant.mainSegue, sender: self)
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

