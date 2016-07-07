//
//  GeniusTableViewCellTests.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 7/7/16.
//    Copyright © 2016 Canonical Examples. All rights reserved.
//


import XCTest
@testable import VCTDD


class GeniusTableViewCellTests: XCTestCase {

    // MARK: - Parameters & Constants.

    let textToDisplay = "Some text"

    // MARK: - Test vatiables.

    var sut: GeniusTableViewCell!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        sut = GeniusTableViewCell()
    }


    override func tearDown() {
        releaseSut()

        super.tearDown()
    }

    func releaseSut() {
        sut = nil
    }


    // MARK: - Basic test.

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }


    // MARK: - Display methods
    
    func testDisplayNameSetsTextOfNameLabel() {
        let mockLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        sut.nameLabel = mockLabel
        
        sut.display(name: textToDisplay)
        let text = sut.nameLabel?.text ?? ""

        XCTAssertEqual(text, textToDisplay)
    }
    

    func testDisplaySkillSetsTextOfNameLabel() {
        let mockLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        sut.skillLabel = mockLabel
        
        sut.display(skill: textToDisplay)
        let text = sut.skillLabel?.text ?? ""
        
        XCTAssertEqual(text, textToDisplay)
    }


    // MARK: - Stubs & Mocks.

}
