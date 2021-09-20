//
//  WeatherViewModel.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 19.09.2021.
//

import Foundation

class WeatherViewModel{
    lazy var weatherManager = WeatherAPIManager()
    
    var getWeatherCallback: ((Result<Weather, Error>) -> ())?
    
    func bind(callback: @escaping (Result<Weather, Error>) -> () ) {
        self.getWeatherCallback = callback
    }
    func getWeather(){
        weatherManager.getWeather{ [weak self] result in
            guard let self = self else {return}
            switch result{
            case .failure(let error):
                self.getWeatherCallback?(.failure(error))
            case .success(let weather):
                self.getWeatherCallback?(.success(weather))
            }
        }
    }
}
