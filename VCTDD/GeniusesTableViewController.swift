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
    var presenter: GeniusesListPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForDynamicHeightCells()
        presenter?.viewCreated()
    }
    
    func setUpForDynamicHeightCells() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 56.0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return presenter?.numberOfGeniuses() ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GeniusTableViewCellID", forIndexPath: indexPath) as! GeniusTableViewCell
        presenter?.configure(cell: cell, forRow: 0)
        return cell
    }
}

