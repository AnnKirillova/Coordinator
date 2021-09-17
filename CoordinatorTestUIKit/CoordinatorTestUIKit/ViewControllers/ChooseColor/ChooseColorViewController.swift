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
    let viewModel = ChooseColorViewModule()
    
    @IBAction func getColorAction(_ sender: UIButton) {
       let color = viewModel.getColor(by: sender.tag)
        coordinator?.colorSubscription(with: color)
    }
}
