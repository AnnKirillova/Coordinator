//
//  ColorViewController.swift
//  CoordinatorTestUIKit
//
//  Created by Ann on 15.09.2021.
//

import UIKit

class ColorViewController: UIViewController, Storyboarded {
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    var coordinator: MainCoordinator?
    lazy var viewModel = ColorViewModel(with: self)
    
    var color: UIColor? {
        didSet {
            guard color != nil else {return}
            DispatchQueue.main.async {
                self.view.backgroundColor = self.color
                self.spinnerView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Your color is..."
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if color == nil {
                spinnerView.isHidden = false
                viewModel.getRandomCollor()
            }
    }
    
    func showError(with message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
