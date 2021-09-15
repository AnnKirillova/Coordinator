//
//  MainCoordinator.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator{
    var childCoordinators = [Coordinator]()
    var navigationController = UINavigationController()
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func colorSubscription(with color: UIColor){
        let vc = ColorController.instantiate()
        vc.coordinator = self
        vc.color = color
        navigationController.pushViewController(vc, animated: true)
    }
    
    func chooseColor(){
        let vc = ChooseColorController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
