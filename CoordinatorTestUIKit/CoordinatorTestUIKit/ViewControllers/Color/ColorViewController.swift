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
    lazy var viewModel = ColorViewModel()
    
    var color: UIColor? {
        didSet {
            guard color != nil else {return}
            view.backgroundColor = self.color
            spinnerView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Your color is..."
        
        viewModel.bind {[weak self] result in
            guard let self = self else {return}
            
            switch result{
            case .success(let color):
                self.color = color
            case .failure(let error):
                self.showError(with: error.localizedDescription)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if color == nil {
            spinnerView.isHidden = false
            viewModel.getRandomCollor()
        }
    }
}
