//
//  ViewController.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 5/7/16.
//  Copyright © 2016 Canonical Examples. All rights reserved.
//


import UIKit


class GeniusesTableViewController: UITableViewController {
    static let ID = "GeniusesTableViewControllerID"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForDynamicHeightCells()
    }
    
    func setUpForDynamicHeightCells() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 56.0
    }

}

