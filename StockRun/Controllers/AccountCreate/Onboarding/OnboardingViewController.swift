//
//  OnboardingViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/29/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet var overlay: UIView!
    @IBOutlet var purchaseStocksLabel: UILabel!
    
    override func viewDidLoad() {
        UIView.animate(withDuration: 2) {
            self.overlay.frame = self.view.frame.insetBy(dx: 0, dy: -300)
            self.purchaseStocksLabel.frame = self.view.frame.insetBy(dx: self.purchaseStocksLabel.bounds.origin.x, dy: -300)
        }
    }
}
