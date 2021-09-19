//
//  ColorViewModel.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 17.09.2021.
//

import Foundation
import UIKit


class ColorViewModel {
    weak var colorViewController: ColorViewController?
    lazy var colorManager = NumberRequestManager()
    
    var getColorCallback: ((Result<UIColor, Error>) -> ())?
    
    func bind(callback: @escaping (Result<UIColor, Error>) -> () ) {
        self.getColorCallback = callback
    }
    
    func getRandomCollor(){
        colorManager.getNumbers { [weak self] result in
            guard let self = self else {return}
            switch result{
            case .failure(let error):
                self.colorViewController?.showError(with: error.localizedDescription)
                self.getColorCallback?(.failure(error))
            case .success(let colorNumber):
                if colorNumber.count >= 3 {
                    let color = UIColor(
                        red: colorNumber[0]/255.0,
                        green: colorNumber[1]/255.0,
                        blue: colorNumber[2]/255.0,
                        alpha: 1
                    )
                    self.getColorCallback!(.success(color))
                } else {
                    self.colorViewController?.showError(with: "Bad response")
                    let badRequestError = AppError.badRequestError
                    self.getColorCallback?(.failure(badRequestError))
                }
                
            }
        }
    }
    
}
