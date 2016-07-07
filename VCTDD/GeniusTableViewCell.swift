//
//  GeniusTableViewCell.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 5/7/16.
//  Copyright © 2016 Canonical Examples. All rights reserved.
//


import UIKit


class GeniusTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!

    func display(name name: String) {
        nameLabel?.text = name
    }

    func display(skill skill: String) {
        skillLabel?.text = skill
    }
}
