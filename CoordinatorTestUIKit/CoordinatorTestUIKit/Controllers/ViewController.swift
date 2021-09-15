//
//  ViewController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    static func instantiate() -> Self {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        return story.instantiateInitialViewController() as! Self
    }
    
    var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextPageActionButton(_ sender: UIButton) {
        coordinator?.chooseColor()
    }
    
}

