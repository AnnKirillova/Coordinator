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
        let vc = MainViewController.instantiate()
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func colorSubscription(with color: UIColor?) {
        let vc = ColorViewController.instantiate()
        vc.coordinator = self
        vc.color = color
        navigationController.pushViewController(vc, animated: true)
    }
    
    func chooseColor() {
        // let chooseColor = ChooseColorCoordinator()
        // chooseColor.start()
        let vc = ChooseColorViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func mainViewControllerWillShowChooseColor(_ sender: MainViewController) {
        chooseColor()
    }
}
