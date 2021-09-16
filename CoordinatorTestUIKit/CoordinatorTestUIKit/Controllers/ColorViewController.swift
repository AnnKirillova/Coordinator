//
//  ColorViewController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit

class ColorViewController: UIViewController, Storyboarded {
   
    var coordinator: MainCoordinator?
    
    var color: UIColor? {
        didSet {
            self.view.backgroundColor = color
        }
    }
}
