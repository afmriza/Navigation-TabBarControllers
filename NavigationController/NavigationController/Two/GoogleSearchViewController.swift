//
//  GoogleSearchViewController.swift
//  NavigationController
//
//  Created by The App Experts on 05/03/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class GoogleSearchViewController: UIViewController {

    // An outlet for the WebView
    @IBOutlet var webView: UIWebView!
    
    // An optional property to help store which item was selected to search for
    var searchItem: String?
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // Attempt to both safely get the search term and URL encode it
        guard let searchText = searchItem?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
            let url = URL(string: "https://www.google.co.uk/#q=\(searchText)") else { return }
        
        // Load the URL into the WebView
        webView.loadRequest(URLRequest(url: url))
    }
}
