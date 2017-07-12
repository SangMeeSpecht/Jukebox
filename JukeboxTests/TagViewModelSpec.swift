//
//  TagViewModelSpec.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
@testable import Jukebox

class TagViewModelSpec: QuickSpec {
    override func spec() {
        let tagViewModel = Jukebox.TagViewModel(service: MusicService())

        describe(".getTagCount") {
            it("returns a count of tags") {
                expect(tagViewModel.getTagCount()).toEventually(equal(3))
            }
        }
        
        describe(".getTagTitle") {
            it("returns the title for a tag") {
                let indexPath = IndexPath(row: 0, section: 0)
                expect(tagViewModel.getTagTitle(at: indexPath)).toEventually(equal("ARTISTS"))
            }
        }
        
        describe("getTagID") {
            it("returns the id based on the tag title") {
                let indexPath = IndexPath(row: 1, section: 0)
                expect(tagViewModel.getTagID(at: indexPath)).toEventually(equal("2"))
            }
        }
    }
}

