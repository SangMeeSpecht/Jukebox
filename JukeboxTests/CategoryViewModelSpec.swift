//
//  CategoryViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
@testable import Jukebox

class CategoryViewModelSpec: QuickSpec {
    override func spec() {
        let categoryViewModel = Jukebox.CategoryViewModel(service: MusicService(), categoryID: "3")
        let indexPath = IndexPath(row: 0, section: 0)

        describe(".getCategoryCount") {
            it("returns a count of categories") {
                expect(categoryViewModel.getCategoryCount()).toEventually(equal(3))
            }
        }
        
        describe(".getCategoryName") {
            it("returns the name for a category") {
                expect(categoryViewModel.getCategoryName(at: indexPath)).toEventually(equal("ROCK"))
            }
        }
        
        describe(".getSongIDs") {
            it("returns a collection of song ids for a category") {
                expect(categoryViewModel.getSongIDs(at: indexPath)).toEventually(equal([1,3,5,6,7,8,13,14,15]))
            }
        }
    }
}
