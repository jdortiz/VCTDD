//
//  GeniusesListPresenterTests.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 7/7/16.
//    Copyright © 2016 Canonical Examples. All rights reserved.
//


import XCTest
@testable import VCTDD


class GeniusesListPresenterTests: XCTestCase {

    // MARK: - Parameters & Constants.

    let oneDataSet = [ (name: "Dr. Octopus", skill: "Do 8+ things at the same time") ]
    let anotherDataSet = [ (name: "Randal", skill: "Be invisible"),
                           (name: "Kinping", skill: "Pure strength"),
                           (name: "Donkey Kong", skill: "Throw many barells"), ]

    // MARK: - Test vatiables.

    var sut: GeniusesListPresenter!
    var model: GeniusesModelMock!

    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        model = GeniusesModelMock()
        sut = GeniusesListPresenter(model: model)
    }


    override func tearDown() {
        releaseSut()

        super.tearDown()
    }

    func releaseSut() {
        sut = nil
        model = nil
    }


    // MARK: - Basic test.

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    func testInitializerPreservesModel() {
        XCTAssertTrue(sut.model === model)
    }
    

    // MARK: - Interaction with the model
    
    func testViewCreatedFetchesDataFromModel() {
        sut.viewCreated()
        
        XCTAssertTrue(model.verifyDataIsFetched())
    }

    
    func testNumberOfGeniusesCorrespondsToOneNumberOfFetchedItems() {
        model.dataSet = oneDataSet
        
        sut.viewCreated()
        
        XCTAssertEqual(sut.numberOfGeniuses(), oneDataSet.count)
    }

    
    func testNumberOfGeniusesCorrespondsToAnotherNumberOfFetchedItems() {
        model.dataSet = anotherDataSet

        sut.viewCreated()

        XCTAssertEqual(sut.numberOfGeniuses(), anotherDataSet.count)
    }

    
    func testConfiguresCellWithContentOfCorrespondingFetchedItem() {
        model.dataSet = anotherDataSet
        sut.viewCreated()
        let cellMock = GeniusTableViewCellMock()
        
        sut.configure(cell: cellMock, forRow: 1)

        XCTAssertTrue(cellMock.verifyCellDisplays(name: anotherDataSet[1].name, skill: anotherDataSet[1].skill))
    }
    


    // MARK: - Stubs & Mocks.

    class GeniusesModelMock: GeniusesModel {
        var isFetchDataInvoked = false
        var dataSet: [(name: String, skill: String)]?

        override func fetchData() -> [(name: String, skill: String)] {
            isFetchDataInvoked = true
            return dataSet ?? []
        }

        func verifyDataIsFetched() -> Bool {
            return isFetchDataInvoked
        }
    }


    class GeniusTableViewCellMock: GeniusTableViewCell {
        var displayedName = ""
        var displayedSkill = ""

        override func display(name name: String) {
            displayedName = name
        }
        
        override func display(skill skill: String) {
            displayedSkill = skill
        }

        func verifyCellDisplays(name name: String, skill: String) -> Bool {
            return (displayedName == name) && (displayedSkill == skill)
        }
    }
}
