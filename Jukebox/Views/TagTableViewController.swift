//
//  TagTableViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit


class TagTableViewController: UITableViewController {
    var tagViewModel: TagViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagViewModel = TagViewModel(service: MusicService())
        let _ = tagViewModel.tags.producer.startWithValues { _ in
            self.tableView.reloadData()
        }
        styleView()
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70.0)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Categories":
                if let cell = sender as? UITableViewCell {
                    if let seguedToMVC = segue.destination as? CategoryTableViewController {
                        if let indexPath = tableView.indexPath(for: cell) {
                            seguedToMVC.tagID = tagViewModel.getTagID(at: indexPath)
                        }
                    }
                }
            default: break
            }
        }
    }
    
    private func styleView() {
        setBackgroundImageWithBlur()
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


