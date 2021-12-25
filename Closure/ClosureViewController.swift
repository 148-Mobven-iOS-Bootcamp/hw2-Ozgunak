//
//  ClosureViewController.swift
//  Homework 2
//
//  Created by ozgun on 25.12.2021.
//

import UIKit

class ClosureViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    var completion: ((_ message: String) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    //Gets text fields message and makes a complation method with it.
    @IBAction func goButtonPressed(_ sender: UIButton) {
        if let message = messageTextField.text, let completion = completion {
            completion(message)
            dismiss(animated: true, completion: nil)
        }
    }
    

}
