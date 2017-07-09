//
//  CategoryTableViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    var categoryViewModel: CategoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryViewModel = CategoryViewModel(service: MusicService())
        
        let _ = categoryViewModel.categories.producer.startWithValues { _ in
            self.tableView.reloadData()
        }
        
        self.navigationItem.title = categoryViewModel.getNavTitle()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryViewModel.getCategoryCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category Cell", for: indexPath)

        if let categoryName = categoryViewModel.getCategoryName(at: indexPath) {
            cell.textLabel?.text = categoryName
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Songs":
                if let seguedtoVC = segue.destination as? SongCollectionViewController {
                    if let cell = sender as? UITableViewCell {
                        let indexPath = tableView.indexPath(for: cell)
                        seguedtoVC.songViewModel = SongViewModel(songIDs: categoryViewModel.getSongIDs(at: indexPath!)!)
                    }
                }
            default: break 
            }
        }
    }
}
