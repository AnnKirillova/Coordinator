//
//  ChooseColorController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit
class ChooseColorController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instantiate() -> Self {
        let story = UIStoryboard(name: "ChooseColorStoryboard", bundle: Bundle.main)
        return story.instantiateInitialViewController()!
    }
    
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
