//
//  ChooseColorViewController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit

enum Colors: Int {
    case red
    case orange
    case yellow
    case green
    case blue
    case dark
    case purple
}

class ChooseColorViewController: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    @IBAction func redAction(_ sender: UIButton) {
        coordinator?.colorSubscription(with: .red)
    }
    
    @IBAction func orangeAction(_ sender: UIButton) {
        coordinator?.colorSubscription(with: .orange)
    }
    
    @IBAction func yellowAction(_ sender: Any) {
        coordinator?.colorSubscription(with: .yellow)
    }
    
    @IBAction func greenAction(_ sender: UIButton) {
        coordinator?.colorSubscription(with: .green)
    }
    
    @IBAction func blueAction(_ sender: UIButton) {
        coordinator?.colorSubscription(with: .systemBlue)
    }
    
    @IBAction func darkBlueAction(_ sender: UIButton) {
        coordinator?.colorSubscription(with: .blue)
    }
    
    @IBAction func purpleAction(_ sender: UIButton) {
        coordinator?.colorSubscription(with: .purple)
    }
}
