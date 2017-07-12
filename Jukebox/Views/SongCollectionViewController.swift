//
//  SongCollectionViewController.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/23/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit

class SongCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var songViewModel: SongViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = songViewModel?.songs.producer.startWithValues { _ in
            self.collectionView?.reloadData()
        }
        styleView()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songViewModel?.getSongCount() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCell", for: indexPath) as? SongCollectionViewCell
        
        cell?.indexPath = indexPath
        cell?.songViewModel = songViewModel
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 1
        let itemWidth = collectionView.bounds.width / itemsPerRow
        let itemHeight = collectionView.bounds.height
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    private func styleView() {
        setBackgroundImageWithBlur()
        self.navigationItem.title = songViewModel?.getNavTitle()
    }
    
    private func setBackgroundImageWithBlur() {
        let backgroundImage = UIImage(named: "glitterLightBlur.jpg")
        let imageView = UIImageView(image: backgroundImage)
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = (collectionView?.bounds)!
//        imageView.addSubview(blurView)
        self.collectionView?.backgroundView = imageView
    }
}
