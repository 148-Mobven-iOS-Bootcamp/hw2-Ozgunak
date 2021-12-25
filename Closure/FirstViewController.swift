//
//  FirstViewController.swift
//  Homework 2
//
//  Created by ozgun on 25.12.2021.
//  Screen shots avaible in readme file

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func writePressed(_ sender: UIButton) {
    }
    
    //Gets message from Closure View Controller and chances label according to info in it.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let closureVC = segue.destination as? ClosureViewController {
            closureVC.completion = { message in
                self.messageLabel.text = message
            }
        }
    }
}
