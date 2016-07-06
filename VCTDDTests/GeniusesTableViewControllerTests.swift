//
//  GeniusesTableViewControllerTests.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 6/7/16.
//    Copyright © 2016 Canonical Examples. All rights reserved.
//


import XCTest
@testable import VCTDD


class GeniusesTableViewControllerTests: XCTestCase {

    // MARK: - Parameters & Constants.

    let storyboardName = "Main"


    // MARK: - Test vatiables.

    var sut: GeniusesTableViewController!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier(GeniusesTableViewController.ID) as! GeniusesTableViewController
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


    // MARK: - Stubs & Mocks.


}
