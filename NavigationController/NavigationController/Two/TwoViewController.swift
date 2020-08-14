//
//  TwoViewController.swift
//  NavigationController
//
//  Created by Brian @ TAE on 05/03/2020.
//  Copyright © 2020 Brian @ TAE. All rights reserved.
//

import UIKit

class TwoModel {
    
    var items: [String]
    
    init() {
        items = []
    }
    
    func append(_ item: String) {
        items.append(item)
    }
    
}

extension TwoModel {
    
    var sections: Int { return 1 }
    
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> String? {
        if indexPath.section < 0 || indexPath.section > sections { return nil }
        if indexPath.row < 0 || indexPath.row > numberOfItems(in: indexPath.section) { return nil }
        
        return items[indexPath.row]
        
    }
    
}

class TwoViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    
    var model: TwoModel = TwoModel()
    
    private let cell_id = "UITableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //model =
        
        // register the cell for reuse
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cell_id)
        
        // This will remove the empty cells to make things look nicer
        tableview.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension TwoViewController: DataAppendDelegate {
    
    func append(_ data: String) -> Bool {
        
        model.append(data)
        
        // We use optional chaining here as the obj might not exist if the view HAS NOT been loaded into memory
        tableview?.reloadData()
        return true
    }

}

extension TwoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_id, for: indexPath)
        
        guard let currentItem = model.item(at: indexPath) else {
            return cell
        }
        
        cell.textLabel?.text = currentItem
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedItem = model.item(at: indexPath) else {
            return print("No Item found")
        }
        
        let googleResults = GoogleSearchViewController(nibName: "GoogleSearchViewController", bundle: nil)
        googleResults.searchItem = selectedItem
        navigationController?.pushViewController(googleResults, animated: true)
    }
    
}
