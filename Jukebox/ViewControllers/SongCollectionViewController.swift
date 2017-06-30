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

        songViewModel?.reloadTableView = { viewModel in
            self.collectionView?.reloadData()
        }
        
        self.navigationItem.title = "Songs"
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (songViewModel?.getSongCount())!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCell", for: indexPath) as? SongCollectionViewCell

        cell?.albumCover.image = UIImage(data: (songViewModel?.getCoverArt(at: indexPath))!)
        
        cell?.songName.text = songViewModel?.getSongName(at: indexPath)
        
        cell?.songDescription.text = songViewModel?.getSongDescription(at: indexPath)
        
        return cell!
    }
}
