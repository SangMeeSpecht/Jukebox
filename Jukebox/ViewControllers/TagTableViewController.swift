//
//  TagTableViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class TagTableViewController: UITableViewController {
    var tagViewModel: TagViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagViewModel = TagViewModel(service: MusicService())
        
        let _ = tagViewModel.tags.producer.startWithValues { _ in
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagViewModel.getTagCount() 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tag Cell", for: indexPath)
        
        if let tagTitle = tagViewModel.getTagTitle(at: indexPath) {
            cell.textLabel?.text = tagTitle
        }
        
        return cell
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier = segue.identifier {
//            switch identifier {
//            case "Show Category":
//                if let cell = sender as? UITableViewCell {
//                    if let seguedToMVC = segue.destination as? CategoryTableViewController {
////                        set specific tag_ids/route, change to be dynamic
////                        seguedToMVC.tagID = tagViewModel.getTagID(withTitle: cell.textLabel?.text)
//                    }
//                }
//            default: break
//            }
//        }
//    }
}


