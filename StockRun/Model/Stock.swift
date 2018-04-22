//
//  Stock.swift
//  StockRun
//
//  Created by Michael Rojas on 4/4/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

struct Stock: Decodable {
    let companyName: String
    let symbol: String
    var latestPrice: Double?
}
