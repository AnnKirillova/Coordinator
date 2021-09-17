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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func nextPageActionButton(_ sender: UIButton) {
        delegate?.mainViewControllerWillShowChooseColor(self)
    }
    
}

