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
    lazy var colorManager = NumberRequestManager()
    
    var color: UIColor? {
        didSet {
            guard color != nil else {return}
            DispatchQueue.main.async {
                self.view.backgroundColor = self.color
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if color == nil {
                getRandomCollor()
            }
    }
    
    func getRandomCollor(){
        spinnerView.isHidden = false
        colorManager.getNumbers {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .failure(let error):
                self.showError(with: error.localizedDescription)
            case .success(let color):
                if color.count >= 3{
                    self.color = UIColor(red: color[0]/255.0, green: color[1]/255.0, blue: color[2]/255.0, alpha: 1)
                } else {
                    self.showError(with: "Bad response")
                }
            }
            DispatchQueue.main.async {
                self.spinnerView.isHidden = true
            }
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
