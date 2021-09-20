//
//  WeatherAPIManager.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 19.09.2021.
//

import Foundation
import UIKit

class WeatherAPIManager{
    func getWeather(with completion: @escaping (_ result: Result<Weather, Error>) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&units=metric&appid=bf4a082e9e1e2e480e4e0465769e4df3")
        else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            if (response as? HTTPURLResponse)!.statusCode != 200 {
                let responseError = AppError.responseError
                completion(.failure(responseError))
                print(responseError.localizedDescription)
                return
            }
            
            guard let data = data else {
                let noDataError = AppError.noData
                completion(.failure(noDataError))
                print(noDataError.localizedDescription)
                return
            }
            
            do {
                let dataJson = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(dataJson))
                print(dataJson)
            } catch let error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }.resume()
    }
}
