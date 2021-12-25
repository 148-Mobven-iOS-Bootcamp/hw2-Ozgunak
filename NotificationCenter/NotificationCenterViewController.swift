//
//  NotificationCenterViewController.swift
//  Homework 2
//
//  Created by ozgun on 25.12.2021.
//

import UIKit

class NotificationCenterViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(notifiedFunc), name: Notification.Name(rawValue: "uniqueKey"), object: nil)
    }
    
    @objc func notifiedFunc(_ notification: Notification){
        statusLabel.text = "Notification Connection Granted"
        if let data = notification.userInfo!["userMessage"] as? String{
            messageLabel.text = data
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSVC"{
             
        }
    }

    @IBAction func connectButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSVC", sender: self)
    }
    
}

