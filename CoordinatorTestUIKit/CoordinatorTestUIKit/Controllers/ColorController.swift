//
//  ColorController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit

class ColorController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var color: UIColor?{
        didSet{
            self.view.backgroundColor = color
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instantiate() -> Self {
        let story = UIStoryboard(name: "ColorStoryboard", bundle: Bundle.main)
        return story.instantiateInitialViewController()!
    }
}
