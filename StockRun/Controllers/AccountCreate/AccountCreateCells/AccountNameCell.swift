//
//  AccountNameCell.swift
//  StockRun
//
//  Created by Michael Rojas on 4/29/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

class AccountNameCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setHighlighted(false, animated: false)
    }
    
}

extension AccountNameCell: CellInterface {
    func configure<T>(with cell: T) {
        
    }
}
