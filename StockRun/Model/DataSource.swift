//
//  DataSource.swift
//  StockRun
//
//  Created by Michael Rojas on 4/4/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import Foundation
import UIKit

class DataSource {
    static let shared = DataSource()
    
    private init() {
        print("SingletonBOIS")
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    func getPriceOfCompany(with symbol: String, completion: @escaping (_ result: Stock?) -> Void) {
        let urlString = "https://api.iextrading.com/1.0/stock/\(symbol)/quote"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                
            }
            
            guard let data = data else { return }
            do {
                print(data)
                let stock = try JSONDecoder().decode(Stock.self, from: data)
                DispatchQueue.main.async {
                    completion(stock)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            }.resume()
    }
    
    func addStock(stock: Stock) {
        let stockSave = Stocks(context: context)
        stockSave.companyName = stock.companyName
        stockSave.symbol = stock.symbol
        if let price = stock.latestPrice {
            stockSave.latestPrice = price
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func getUserStocks() -> [Stock]? {
        var stocksData: [Stock] = []
        var stocks: [Stocks]?
        do {
            stocks = try context.fetch(Stocks.fetchRequest())
        }catch {
            print("Error fetching data from CoreData")
        }
        if let stocks = stocks {
            for item in stocks {
                if let stockName = item.companyName, let symbol = item.symbol {
                    let stock = Stock.init(companyName: stockName, symbol: symbol, latestPrice: item.latestPrice)
                    stocksData.append(stock)
                }
            }
        }
        
        return stocksData
    }
    
    
}
