//
//  OneViewController.swift
//  NavigationController
//
//  Created by The App Experts on 05/03/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

// A delegate to help talk to the other View Controller
protocol DataAppendDelegate: class {
    
    // Attempts to add the string to the array, return a Boolean to indicate it's success
    func append(_ data: String) -> Bool
    
}

class OneViewController: UIViewController {

    // An outlet for the textfield
    @IBOutlet var textfield: UITextField!
    
    // A delegate property
    weak var delegate: DataAppendDelegate?
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Safely get the text from the text field
        guard var text = textfield.text else { return }
        
        // Trim any white spaces
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if the text is empty
        if text.isEmpty { return }
        
        // Attempt to add it to the delegated class
        if delegate?.append(text) == true {
            
            // If successful, display an alert
            let alert = UIAlertController(title: "Success", message: "Saved \"\(text)\"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        // Clear the text in the text field
        textfield.text = nil
        
    }
}
