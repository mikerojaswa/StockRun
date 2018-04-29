//
//  StockDetailViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/14/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import Foundation
import UIKit

class StockDetailViewController: UIViewController {
    var stock: Stock?
    @IBOutlet var stockNameLabel: UILabel!
    @IBOutlet var currentPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let stock = stock else { return }
        stockNameLabel.text = stock.companyName
        
        DataSource.shared.getPriceOfCompany(with: stock.symbol) { result in
            if let result = result, let price = result.latestPrice {
                let priceString = String(price)
                self.currentPriceLabel.text = priceString
                self.stock?.latestPrice = price
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func purchaseButtonPressed(_ sender: Any) {
        guard let stock = stock else { return }
        DataSource.shared.addStock(stock: stock)
    }
}
