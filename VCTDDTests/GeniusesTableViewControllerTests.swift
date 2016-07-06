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
    var presenter: GeniusesListPresenterMock!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        presenter = GeniusesListPresenterMock()
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier(GeniusesTableViewController.ID) as! GeniusesTableViewController
    }


    override func tearDown() {
        releaseSut()

        super.tearDown()
    }

    func releaseSut() {
        sut = nil
        presenter = nil
    }


    // MARK: - Basic test.

    func testSutIsntNil() {
        XCTAssertNotNil(sut, "Sut must not be nil.")
    }

    
    func testTableRowHeightIsAutomatic() {
        _ = sut.view

        XCTAssertEqual(sut.tableView.rowHeight, UITableViewAutomaticDimension)
    }

    
    func testTableEstimatedRowHeightIsSet() {
        _ = sut.view
        
        XCTAssertTrue(sut.tableView.estimatedRowHeight > 0.0)
    }
    

    // MARK: - Event handling in the presenter

    func testViewDidLoadInvokesViewCreatedEvent() {
        sut.presenter = presenter

        _ = sut.view

        // Assert
        XCTAssertTrue(presenter.isViewCreatedInvoked)
    }
    

    
    // MARK: - Stubs & Mocks.

    class GeniusesListPresenterMock: GeniusesListPresenter {
        var isViewCreatedInvoked = false
        
        override func viewCreated() {
            isViewCreatedInvoked = true
        }
    }
}
