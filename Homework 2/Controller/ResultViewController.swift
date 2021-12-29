//
//  ResultViewController.swift
//  Homework 2
//
//  Created by ozgun on 24.12.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var tempeture = "0"
    var city = "City"
    var newImage = UIImage(systemName: "cloud")
    override func viewDidLoad() {
        super.viewDidLoad()

        tempLabel.text = tempeture
        cityLabel.text = city
        image.image = newImage
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
