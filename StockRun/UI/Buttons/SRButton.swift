//
//  SRButton.swift
//  StockRun
//
//  Created by Michael Rojas on 4/13/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

enum ButtonStyle {
    case filled
    case unfilled
}

@IBDesignable class SRButton: UIButton {
    
    @IBInspectable var fillButton: Bool = false {
        didSet {
            updateButtonFill()
        }
    }
    
    @IBInspectable var cornerRad: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = 10
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = Fonts.avenirTwentyFour
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    fileprivate func updateButtonFill() {
        if fillButton {
            self.layer.borderWidth = 0
            self.setTitleColor(.black, for: .normal)
            self.backgroundColor = UIColor.white
        } else {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .clear
        }
    }
}
