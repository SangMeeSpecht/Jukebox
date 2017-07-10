//
//  SongViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/9/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
@testable import Jukebox

class SongViewModelSpec: QuickSpec {
    override func spec() {
        let songViewModel = Jukebox.SongViewModel(service: MusicService(), songIDs: [])
        let indexPath = IndexPath(row: 2, section: 0)
        
        describe(".getSongCount") {
            it("returns a count of songs") {
                expect(songViewModel.getSongCount()).toEventually(equal(8))
            }
        }
        
        describe(".getSongName") {
            it("returns the name for a song") {
                expect(songViewModel.getSongName(at: indexPath)).toEventually(equal("Song3"))
            }
        }
        
        describe(".getSongDescription") {
            it("returns a description for a song") {
                expect(songViewModel.getSongDescription(at: indexPath)).toEventually(equal("3 description"))
            }
        }
        
        describe(".getCoverArtURL") {
            it("returns a URL for a song's album") {
                let imageData = URL(string: "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg")
                expect(songViewModel.getCoverArt(at: indexPath)).toEventually(equal(imageData))
            }
        }
    }
}

