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
        let songViewModel = Jukebox.SongViewModel()
        
        describe(".getSongCount") {
            it("returns a count of songs") {
                expect(songViewModel.getSongCount()).toEventually(equal(4))
            }
        }
        
        describe(".getSongName") {
            it("returns the name for a song") {
                let indexPath = IndexPath(row: 2, section: 0)
                expect(songViewModel.getSongName(at: indexPath)).toEventually(equal("Song3"))
            }
        }
    }
}
