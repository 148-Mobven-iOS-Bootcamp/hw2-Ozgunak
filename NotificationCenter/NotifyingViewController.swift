//
//  NotifyingViewController.swift
//  Homework 2
//
//  Created by ozgun on 25.12.2021.
//

import UIKit

class NotifyingViewController: UIViewController {

    var messageContent = ["userMessage": ""]
    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if messageTextField.text != "" {
            messageContent["userMessage"] = messageTextField.text
            NotificationCenter.default.post(name: Notification.Name(rawValue: "uniqueKey"), object: self, userInfo: messageContent)
            dismiss(animated: true, completion: nil)

        }

    }
    
  
    
}
