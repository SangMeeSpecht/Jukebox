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
        var tagViewModel: TagViewModel?

        beforeEach {
            tagViewModel = Jukebox.TagViewModel()
        }

        describe(".getTagCount") {
            it("returns a count of tags") {
                expect(tagViewModel?.getTagCount()).to(equal(3))
            }
        }
        
        describe(".getTagTitle") {
            it("returns the title for a tag") {
                let indexPath = IndexPath(row: 2, section: 0)
                expect(tagViewModel?.getTagTitle(at: indexPath)).to(equal("Genre"))
            }
        }
        
        describe("getTagID") {
            it("returns the id based on the tag title") {
                expect(tagViewModel?.getTagID(withTitle: "Genre")).to(equal("3"))
            }
        }
    }
}

