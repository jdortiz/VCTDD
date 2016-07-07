//
//  GeniusesListPresenter.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 6/7/16.
//  Copyright © 2016 Canonical Examples. All rights reserved.
//


import Foundation


class GeniusesListPresenter {

    let model: GeniusesModel
    var dataSet: [(name: String, skill: String)] = []
    
    init(model: GeniusesModel) {
        self.model = model
    }
    
    func viewCreated() {
        dataSet = model.fetchData()
    }

    func numberOfGeniuses() -> Int {
        return dataSet.count
    }

    func configure(cell cell: GeniusTableViewCell, forRow row: Int) {
        cell.display(name: dataSet[row].name)
        cell.display(skill: dataSet[row].skill)
    }

}