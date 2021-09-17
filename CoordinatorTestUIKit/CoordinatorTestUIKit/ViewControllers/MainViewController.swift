//
//  MainViewController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func mainViewControllerWillShowChooseColor(_ sender: MainViewController)
}

class MainViewController: UIViewController, Storyboarded {
    
    weak var delegate: MainViewControllerDelegate?
    
    @IBAction func nextPageActionButton(_ sender: UIButton) {
        delegate?.mainViewControllerWillShowChooseColor(self)
    }
    
}

