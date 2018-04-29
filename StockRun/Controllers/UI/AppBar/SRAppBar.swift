//
//  SRAppBar.swift
//  StockRun
//
//  Created by Michael Rojas on 4/26/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//
import UIKit

class SRAppBar: UIView {
    override func awakeFromNib() {
        setupShadow()
    }
    
    fileprivate func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
    }
}
