//
//  SRCell.swift
//  StockRun
//
//  Created by Michael Rojas on 4/21/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

class SRCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
