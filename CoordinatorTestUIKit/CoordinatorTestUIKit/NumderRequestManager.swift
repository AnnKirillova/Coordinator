//
//  NumderRequest.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 16.09.2021.
//

import Foundation
import UIKit


class NumberRequestManager{
    
    func getNumbers(with completion: @escaping (_ result: Result<[CGFloat], Error>) -> ()){
        let url = URL(string: "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=255&count=3") as! URL
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            do{
                let dataJson = try JSONDecoder().decode([CGFloat].self, from: data!)
                completion(.success(dataJson))
                print(dataJson)
            } catch let error{
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }.resume()
    }
}
