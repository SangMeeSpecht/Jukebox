//
//  SongCollectionViewCell.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/28/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

class SongCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songDescription: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var songViewModel: SongViewModel? {
        didSet {
            removeExistingSongInfo()
            addSongInfo()
            styleCell()
        }
    }
    
    var indexPath: IndexPath?
    
    private func removeExistingSongInfo() {
        songName?.text = nil
        songDescription?.text = nil
        albumCover?.image = nil
    }
    
    private func addSongInfo() {
        setImage()
        setName()
        setDescription()
    }
    
    private func setImage() {
        activityIndicator.startAnimating()
        if let index = indexPath {
            if let imageURL = songViewModel?.getCoverArt(at: index) {
                DispatchQueue.global(qos: .userInitiated).async {
                    if let imageData = try? Data(contentsOf: imageURL) {
                        DispatchQueue.main.async {
                            self.albumCover.image = UIImage(data: imageData)
                            self.activityIndicator.stopAnimating()
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.albumCover.image = UIImage(named: "itunes-no-artwork.jpg")
                        }
                    }
                }
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
    
    private func styleCell() {
        albumCover.clipsToBounds = false
        albumCover.layer.shadowColor = UIColor.white.cgColor
        albumCover.layer.shadowOffset = CGSize(width: 0, height: 0)
        albumCover.layer.shadowOpacity = 0.5
        albumCover.layer.shadowRadius = 10.0
    }
}

