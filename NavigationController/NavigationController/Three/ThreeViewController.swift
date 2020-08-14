//
//  ThreeViewController.swift
//  NavigationController
//
//  Created by The App Experts on 05/03/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    // A reference to the Done bar button
    var doneButtonItem: UIBarButtonItem!
    
    // An outlet to the text field
    @IBOutlet var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the BarButton
        doneButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done(_:)))
    }
    
    @objc func done(_ sender: UIBarButtonItem) {
        
        // Use guard statements to safely fetch the text
        guard let text = textfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        // Update the badge value
        tabBarItem.badgeValue = text.count > 0 ? text : nil
        
        // Clear the text
        textfield.text = nil
        
        // Dismiss keyboard
        textfield.resignFirstResponder()
        
        // Clear the navigation item (make the BarButton disappear)
        navigationItem.rightBarButtonItem = nil
    }

}

extension ThreeViewController: UITextFieldDelegate {
    
    // When the test field starts editing, show the done button
    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationItem.rightBarButtonItem = doneButtonItem
    }
    
}
