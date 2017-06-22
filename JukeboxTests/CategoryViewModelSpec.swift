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

        describe(".getTagCount") {
            it("returns a count of tags") {
                expect(categoryViewModel.getCategoryCount()).toEventually(equal(2))
            }
        }
        
        describe(".getCategoryName") {
            it("returns the name for a category") {
                let indexPath = IndexPath(row: 0, section: 0)
                expect(categoryViewModel.getCategoryName(at: indexPath)).toEventually(equal("Rock"))
            }
        }
    }
}
