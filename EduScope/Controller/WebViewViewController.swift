//
//  WebViewViewController.swift
//  EduScope
//
//  Created by Krish Patel on 3/2/24.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var webURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let url = webURL {
            let myURL = URL(string: "https://\(url)")
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        } else {
            let myURL = URL(string: "https://www.apple.com")
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
    }
    
}
