//
//  SongCollectionViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/23/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SongCollectionViewController: UICollectionViewController {
    var songViewModel: SongViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        songViewModel?.reloadTableView = { viewModel in
            self.collectionView?.reloadData()
        }
        
        self.navigationItem.title = "Songs"
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (songViewModel?.getSongCount())!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCell", for: indexPath) as? SongCollectionViewCell
    
        if try! songViewModel?.getCoverArtURL(at: indexPath)?.asURL() != nil {
            if let imageData = try? Data(contentsOf: (songViewModel?.getCoverArtURL(at: indexPath)?.asURL())!) {
                cell?.albumCover.image = UIImage(data: imageData)
            }
        }
        
        return cell!
    }
    

    // MARK: UICollectionViewDelegate

    
//    
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
 

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
