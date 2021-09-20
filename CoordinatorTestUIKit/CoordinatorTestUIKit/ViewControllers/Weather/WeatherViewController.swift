//
//  WeatherViewController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 19.09.2021.
//

import UIKit

class WeatherViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    var coordinator: MainCoordinator?
    var weather = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWeather()
    }
    
    func setupWeather(){
        weather.bind { [weak self]result in
            guard let self = self else {return}
            switch result{
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError(with: error.localizedDescription)
                }
            case .success(let weather):
                DispatchQueue.main.async {
                    self.temp.text = "Temperature: \(weather.main?.temp ?? 0) ℃"
                    self.feelsLike.text = "Feels like: \(weather.main?.feelsLike ?? 0) ℃"
                    self.tempMin.text = "Temperature min: \(weather.main?.tempMin ?? 0) ℃"
                    self.tempMax.text = "Temperature max: \(weather.main?.tempMax ?? 0) ℃"
                    self.pressure.text = "Pressure: \(weather.main?.pressure ?? 0) gPa"
                }
            }
        }
        weather.getWeather()
    }
    @IBAction func changeAlpha(_ sender: UILongPressGestureRecognizer) {
        weatherImage.alpha -= 0.1
    }
    
}
