//
//  SearchViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/21/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var searchTerms = [String: String]()
    var stock : Stock?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search stocks..."
        tableView.tableHeaderView = searchController.searchBar
        self.definesPresentationContext = true
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailFromSearch" {
            guard let detailViewController = segue.destination as? StockDetailViewController else { return }
            detailViewController.stock = stock
        }
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stockName = Array(searchTerms.keys)[indexPath.row]
        let tickerSymbol = Array(searchTerms.values)[indexPath.row]
        stock = Stock.init(companyName: stockName, symbol: tickerSymbol, latestPrice: nil)
        performSegue(withIdentifier: "toDetailFromSearch", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SRCell", owner: self, options: nil)?.first as! SRCell
        cell.cellLabel.text = Array(searchTerms.keys)[indexPath.row]
        return cell
    }
}

// MARK: UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        if searchText == "" { return }
        let searchTextCleaned = searchText.lowercased()
        let index = searchTextCleaned.index(searchTextCleaned.startIndex, offsetBy: 0)
        let firstCharacter = String(searchTextCleaned[index])
        switch firstCharacter {
        case "a":
            searchTerms = NASDAQ.aBucket
        case "b":
            searchTerms = NASDAQ.bBucket
        case "c":
            searchTerms = NASDAQ.cBucket
        case "d":
            searchTerms = NASDAQ.dBucket
        case "e":
            searchTerms = NASDAQ.eBucket
        case "f":
            searchTerms = NASDAQ.fBucket
        case "g":
            searchTerms = NASDAQ.gBucket
        case "h":
            searchTerms = NASDAQ.hBucket
        case "i":
            searchTerms = NASDAQ.iBucket
        case "j":
            searchTerms = NASDAQ.jBucket
        case "k":
            searchTerms = NASDAQ.kBucket
        case "l":
            searchTerms = NASDAQ.lBucket
        case "m":
            searchTerms = NASDAQ.mBucket
        case "n":
            searchTerms = NASDAQ.nBucket
        case "o":
            searchTerms = NASDAQ.oBucket
        case "p":
            searchTerms = NASDAQ.pBucket
        case "q":
            searchTerms = NASDAQ.qBucket
        case "r":
            searchTerms = NASDAQ.rBucket
        case "s":
            searchTerms = NASDAQ.sBucket
        case "t":
            searchTerms = NASDAQ.tBucket
        case "u":
            searchTerms = NASDAQ.uBucket
        case "v":
            searchTerms = NASDAQ.vBucket
        case "w":
            searchTerms = NASDAQ.wBucket
        case "x":
            searchTerms = NASDAQ.xBucket
        case "y":
            searchTerms = NASDAQ.yBucket
        case "z":
            searchTerms = NASDAQ.zBucket
        default:
            searchTerms = NASDAQ.numericBucket
        }
        tableView.reloadData()
    }
}
