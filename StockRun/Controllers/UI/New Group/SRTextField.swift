//
//  SRTextField.swift
//  StockRun
//
//  Created by Michael Rojas on 4/29/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

@IBDesignable
class SRTextField: UITextField, UITextFieldDelegate{
    let underlineView = UIView()
    override func awakeFromNib() {
        self.borderStyle = .none
        self.backgroundColor = .clear
        self.delegate = self
        underlineView.backgroundColor = UIColor.black
        self.font = Fonts.avenirTwenty
        self.textColor = .white
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        underlineView.frame = CGRect.init(x: self.bounds.minX, y: self.bounds.maxY - 2.5, width: self.bounds.width, height: 1)
        self.addSubview(underlineView)

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        underlineView.backgroundColor = .white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        underlineView.backgroundColor = UIColor.black
    }
    

}
