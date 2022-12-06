//
//  ViewController.swift
//  MyWeather2022App
//
//  Created by macbook on 06.12.22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city", message: nil, style: .alert)
    }
    
    
}

