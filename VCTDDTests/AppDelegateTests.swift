//
//  AppDelegateTests.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 7/7/16.
//    Copyright © 2016 Canonical Examples. All rights reserved.
//


import XCTest
@testable import VCTDD


class AppDelegateTests: XCTestCase {

    // MARK: - Parameters & Constants.



    // MARK: - Test vatiables.

    var sut: AppDelegate!


    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        sut = AppDelegate()
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

    
    func testApplicationDidFinishLaunchingWithOptionsReturnsTrue() {
        XCTAssertTrue(sut.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil))
    }
    


    // MARK: - Stubs & Mocks.


}
