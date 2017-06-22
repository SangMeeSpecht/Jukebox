//
//  CategoryTableViewControllerSpec.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
@testable import Jukebox

class CategoryTableViewControllerSpec: QuickSpec {
    override func spec() {
        var categoryTableViewController: CategoryTableViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name:"Main", bundle:nil)
            categoryTableViewController = storyboard.instantiateViewController(withIdentifier: "CategoryTableViewController") as! CategoryTableViewController
        }
        
        describe("storyboard") {
            it("loads the view") {
                expect(categoryTableViewController?.view).toNot(beNil())
            }
        }
        
        describe("number of sections"){
            it ("should be equal to 1"){
                expect(categoryTableViewController.numberOfSections(in: categoryTableViewController.view as! UITableView)).to(equal(1))
            }
        }
        
        describe("rows in table"){
            it("is equal to the number of tags"){
                let categoryViewModel = CategoryViewModel()
                expect(categoryTableViewController.tableView(categoryTableViewController.view as! UITableView, numberOfRowsInSection: 1)).to(equal(categoryViewModel.getCategoryCount()))
            }
        }
    }
}

