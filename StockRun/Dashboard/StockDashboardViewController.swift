//
//  StockDashboardViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/14/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

class StockDashboardViewController: UIViewController {
    var stocks: [Stock]?
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        stocks = DataSource.shared.getUserStocks()
        tableView.reloadData()
    }
    
}

extension StockDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let stocks = stocks else { return 0 }
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SRCell", owner: self, options: nil)?.first as! SRCell
        guard let stocks = stocks else { return cell }
        cell.cellLabel.text = stocks[indexPath.row].companyName

        if let price = stocks[indexPath.row].latestPrice {
            cell.priceLabel.text = String(price)
        }
        return cell
    }
}
