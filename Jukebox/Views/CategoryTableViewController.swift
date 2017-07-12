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
    var tagID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tagID = tagID {
            categoryViewModel = CategoryViewModel(service: MusicService(), categoryID: tagID)
        }
        let _ = categoryViewModel.categories.producer.startWithValues { _ in
            self.tableView.reloadData()
        }
        styleView()
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Songs":
                if let seguedtoVC = segue.destination as? SongCollectionViewController {
                    if let cell = sender as? UITableViewCell {
                        let indexPath = tableView.indexPath(for: cell)
                        seguedtoVC.songViewModel = SongViewModel(service: MusicService(), songIDs: categoryViewModel.getSongIDs(at: indexPath!)!)
                    }
                }
            default: break 
            }
        }
    }
    
    private func styleView() {
        setBackgroundImageWithBlur()
        self.navigationItem.title = categoryViewModel.getNavTitle()
    }
    
    private func setBackgroundImageWithBlur() {
        let backgroundImage = UIImage(named: "glitter.jpg")
        let imageView = UIImageView(image: backgroundImage)
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = (tableView?.bounds)!
        imageView.addSubview(blurView)
        self.tableView?.backgroundView = imageView
    }
}
