//
//  NumderRequest.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 16.09.2021.
//

import Foundation
import UIKit

enum AppError: Error {
    case responseError
    case noData
    case badRequestError
}

class NumberRequestManager {
    
    func getNumbers(
        with completion: @escaping (_ result: Result<[CGFloat], Error>) -> ()
    )
    {
        
        guard let url = URL(string: "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=255&count=3")
        else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
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
                let dataJson = try JSONDecoder().decode([CGFloat].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataJson))
                }
                print(dataJson)
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    
                }
                print(error.localizedDescription)
            }
        }.resume()
    }
}
