//
//  CategoryViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
import Alamofire
@testable import Jukebox

class CategoryViewModelSpec: QuickSpec {
    override func spec() {
        let categoryViewModel = Jukebox.CategoryViewModel()
        let indexPath = IndexPath(row: 0, section: 0)

        describe(".getTagCount") {
            it("returns a count of tags") {
                expect(categoryViewModel.getCategoryCount()).toEventually(equal(2))
            }
        }
        
        describe(".getCategoryName") {
            it("returns the name for a category") {
                expect(categoryViewModel.getCategoryName(at: indexPath)).toEventually(equal("Rock"))
            }
        }
        
        describe(".getSongIDs") {
            it("returns a collection of song ids for a category") {
                expect(categoryViewModel.getSongIDs(at: indexPath)).toEventually(equal([1,3]))
            }
        }
    }
}
