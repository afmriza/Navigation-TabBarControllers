//
//  AppDelegate.swift
//  NavigationController
//
//  Created by The App Experts on 05/03/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create the TabBar
        let tabbarcontroller = UITabBarController()
        
        // Create the ViewController One
        let one = OneViewController(nibName: "OneViewController", bundle: nil)
        one.title = "One"
        let navOne = UINavigationController(rootViewController: one)
        
        // Create the ViewController Two
        let two = TwoViewController(nibName: "TwoViewController", bundle: nil)
        two.title = "Two"
        // Set the delegate
        one.delegate = two
        let navTwo = UINavigationController(rootViewController: two)
        
        // Create the ViewController Three
        let three = ThreeViewController(nibName: "ThreeViewController", bundle: nil)
        three.title = "Three"
        let navThree = UINavigationController(rootViewController: three)
        
        // Create the ViewController Four
        let four = FourViewController(nibName: "FourViewController", bundle: nil)
        four.title = "Four"
        
        // Create the ViewController Five
        let five = FiveViewController(nibName: "FiveViewController", bundle: nil)
        five.title = "Five"
        
        // Create the ViewController Six
        let six = SixViewController(nibName: "SixViewController", bundle: nil)
        six.title = "Six"
        
        // Set the view controller
        tabbarcontroller.viewControllers = [navOne, navTwo, navThree, four, five, six]
        
        // Create the window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabbarcontroller
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

