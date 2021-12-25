//
//  ViewController.swift
//  Homework 2
//
//  Created by ozgun on 22.12.2021.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    
    @IBOutlet weak var cityNameField: UITextField!
    var weatherManager = WeatherManager()
    var tempName: String = "City"
    var temporaryId: String = "cloud"
    var temporaryTemp: String = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        cityNameField.delegate = self
    }

    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        if let city = cityNameField.text{
            weatherManager.fetchWeather(cityName: city)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.city = tempName
            destinationVC.tempeture = temporaryTemp
            destinationVC.newImage = UIImage(systemName: temporaryId)
        }
    }
    
    fileprivate func ActivateSegue() {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //MARK: - Homework2 delegate section for fetching data and then activate segue

    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.tempName = weather.name
            self.temporaryTemp = weather.tempString
            self.temporaryId = weather.conditionName
            self.ActivateSegue()
        }
        
        print(weather.name)
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            self.cityNameField.placeholder = "Bulunamadı Tekrar Deneyiniz."
            self.view.backgroundColor = .red
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
            
        }
        print(error)
    }
    
    @objc func updateUI() {
        view.backgroundColor = .clear
    }
    //MARK: - Homework2 Delegate section

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Activates when return button pressed.
        cityNameField.endEditing(true)  //klavyeyi kadırır.
        return true
    }
     
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Checks if text field editting is done. If true activates did end editting func.
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Used to get weather info. Can activated with go/return button on keyboard or button on UI.
        if let city = cityNameField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        cityNameField.text = ""

    }
     
}

