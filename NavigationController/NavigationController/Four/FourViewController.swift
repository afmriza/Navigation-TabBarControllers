//
//  FourViewController.swift
//  NavigationController
//
//  Created by The App Experts on 05/03/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set the background colour to a random UIColor
        view.backgroundColor = UIColor.random
        
        // Attempt to get the TabBarController and it's viewControllers array
        guard let viewControllers = tabBarController?.viewControllers else { return }
        
        // Loop through all the viewControllers
        for viewController in viewControllers {
            
            /*
             1. Check of the viewController is a UINavigationController
             2. Check if the viewControler has ThreeViewController as it's root
             3. Check if this viewController has a valid badgeValue
            */
            if let navigation = viewController as? UINavigationController,
                let root = navigation.viewControllers.first as? ThreeViewController,
                let value = root.tabBarItem.badgeValue {
                
                textLabel.text = "Badge value: \(value)"
                
            }
        }
    }

}

// A simple extension on UIColor to generate a random colour
extension UIColor {
    
    static var random: UIColor {
        
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()),
                       alpha: 1.0)
    }
}
