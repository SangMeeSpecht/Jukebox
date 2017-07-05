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
}

extension SongCollectionViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 40
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
