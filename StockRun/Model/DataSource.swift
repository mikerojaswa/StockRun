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
    
    // MARK: Networking
    
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
    
    // MARK: Core Data Stack
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    func updateUserStockPrices(completion: @escaping (_ result: [Stock]?) -> Void) {
        let serviceGroup = DispatchGroup()
        
        var stocks: [Stocks]?
        do {
            stocks = try context.fetch(Stocks.fetchRequest())
        }catch {
            print("Error fetching data from CoreData")
        }
        if let stocks = stocks {
            for item in stocks {
                if let symbol = item.symbol {
                    serviceGroup.enter()
                    getPriceOfCompany(with: symbol, completion: { result in
                        if let price = result?.latestPrice {
                            serviceGroup.leave()
                            print("Set \(symbol) to \(price)")
                            // Hackeybois
                            item.setValue(price, forKey: "latestPrice")
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        }
                    })
                }
            }
        }
        serviceGroup.notify(queue: DispatchQueue.main) {
            completion(self.getUserStocks())
        }
    }
    
    func saveImage(image: UIImage) {
        deleteImages()
        let prof = Profile(context: context)
        let imageData: NSData = UIImageJPEGRepresentation(image, 1)! as NSData
        prof.profileImage = imageData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    fileprivate func deleteImages() {
        do {
            var profiles: [Profile]?
            profiles = try context.fetch(Profile.fetchRequest())
            if let profiles = profiles {
                for item in profiles {
                    context.delete(item)
                    try context.save()
                }
            }
        } catch {
            print("Error fetching data from CoreData")
        }
    }
    
    func getProfileImage() -> UIImage? {
        var profiles: [Profile]?
        do {
            profiles = try context.fetch(Profile.fetchRequest())
        }catch {
            print("Error fetching data from CoreData")
        }
        if let profiles = profiles {
            assert(profiles.count <= 1, "Multiple profiles saved, serious error!")
            for item in profiles {
                let image = UIImage(data: item.profileImage! as Data)!
                return image
            }
        }
        return nil
    }
}
