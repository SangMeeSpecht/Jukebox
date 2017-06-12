//
//  TagTableViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

class TagTableViewController: UITableViewController {
    var tagViewModel: TagViewModel?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tagViewModel = TagViewModel()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TagViewModel().getTagCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tag Cell", for: indexPath)
        
        if let tagCell = cell as? UITableViewCell {
            let tagTitle = tagViewModel?.getTagTitle(at: indexPath)
            cell.textLabel?.text = tagTitle 
        }
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
