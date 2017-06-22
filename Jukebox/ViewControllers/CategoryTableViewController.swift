//
//  CategoryTableViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    var categoryViewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryViewModel.reloadTableView = { viewModel in
            self.tableView.reloadData()
        }
        
        self.navigationItem.title = "Categories"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryViewModel.getCategoryCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category Cell", for: indexPath)

        if let categoryCell = cell as? UITableViewCell {
            if let categoryName = categoryViewModel.getCategoryName(at: indexPath) {
                cell.textLabel?.text = categoryName
            }
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
