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
        let songViewModel = Jukebox.SongViewModel(service: MusicService(), songIDs: [1,3,5,6,7,8])
        let indexPath = IndexPath(row: 1, section: 0)
        
        describe(".getSongCount") {
            it("returns a count of songs") {
                expect(songViewModel.getSongCount()).toEventually(equal(6))
            }
        }
        
        describe(".getSongName") {
            it("returns the name for a song") {
                expect(songViewModel.getSongName(at: indexPath)).toEventually(equal("Bohemian Rhapsody"))
            }
        }
        
        describe(".getSongDescription") {
            it("returns a description for a song") {
                expect(songViewModel.getSongDescription(at: indexPath)).toEventually(equal("Queen"))
            }
        }
        
        describe(".getCoverArtURL") {
            it("returns a URL for a song's album") {
                let songURL = try? "https://upload.wikimedia.org/wikipedia/en/9/9f/Bohemian_Rhapsody.png".asURL()
                expect(songViewModel.getCoverArt(at: indexPath)).toEventually(equal(songURL))
            }
        }
    }
}

