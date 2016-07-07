//
//  AppDelegate.swift
//  VCTDD
//
//  Created by Jorge D. Ortiz Fuentes on 5/7/16.
//  Copyright © 2016 Canonical Examples. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let storyboardName = "Main"
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let model = GeniusesModel()
        let presenter = GeniusesListPresenter(model: model)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let initialNavigationCtlr = storyboard.instantiateInitialViewController() as! UINavigationController
        let mainView = initialNavigationCtlr.topViewController as! GeniusesTableViewController
        mainView.presenter = presenter
        window?.rootViewController = initialNavigationCtlr
        window?.makeKeyAndVisible()
        return true
    }

}

