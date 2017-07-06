//
//  SongCollectionViewCell.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/28/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

class SongCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumCover: UIImageView! {
        didSet {
            activityIndicator.stopAnimating()
        }
    }
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songDescription: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var songViewModel: SongViewModel? {
        didSet {
            updateSongInfo()
        }
    }
    
    var indexPath: IndexPath?
    
    private func updateSongInfo() {
        setImage()
        setName()
        setDescription()
    }
    
    private func setImage() {
        activityIndicator.startAnimating()
        if let index = indexPath {
            if let image = songViewModel?.getCoverArt(at: index) {
                albumCover.image = UIImage(data: image)
            }
        }
    }

    private func setName() {
        if let index = indexPath {
            if let name = songViewModel?.getSongName(at: index) {
                songName.text = name
            }
        }
    }
    
    private func setDescription() {
        if let index = indexPath {
            if let description = songViewModel?.getSongDescription(at: index) {
                 songDescription.text = description
            }
        }
    }
}

