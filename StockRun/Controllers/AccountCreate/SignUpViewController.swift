//
//  SignUpViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/28/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        setupStyles()
    }
    
    fileprivate func setupStyles() {
        tableView.backgroundColor = .clear
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
