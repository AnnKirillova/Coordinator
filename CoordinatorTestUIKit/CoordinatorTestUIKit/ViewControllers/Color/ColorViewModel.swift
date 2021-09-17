//
//  ColorViewModel.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 17.09.2021.
//

import Foundation
import UIKit

class ColorViewModel{
    weak var colorViewController: ColorViewController?
    lazy var colorManager = NumberRequestManager()
    
    init (with vc: ColorViewController){
        self.colorViewController = vc
    }
    
    func getRandomCollor(){
        colorManager.getNumbers {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .failure(let error):
                self.colorViewController?.showError(with: error.localizedDescription)
            case .success(let color):
                if color.count >= 3{
                    self.colorViewController?.color = UIColor(red: color[0]/255.0, green: color[1]/255.0, blue: color[2]/255.0, alpha: 1)
                } else {
                    self.colorViewController?.showError(with: "Bad response")
                }
            }
        }
    }
    
}
