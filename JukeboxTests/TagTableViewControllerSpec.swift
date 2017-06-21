////
////  TagTableViewController.swift
////  Jukebox
////
////  Created by SangMee Specht on 6/12/17.
////  Copyright © 2017 SangMee Specht. All rights reserved.
////
//
//import Quick
//import Nimble
//@testable import Jukebox
//
//class TagTableViewControllerSpec: QuickSpec {
//    override func spec() {
//        var tagTableViewController: TagTableViewController!
//        
//        beforeEach {
//            let storyboard = UIStoryboard(name:"Main", bundle:nil)
//            tagTableViewController = storyboard.instantiateViewController(withIdentifier: "TagTableViewController") as! TagTableViewController
//        }
//        
//        describe("storyboard") {
//            it("loads the view") {
//                expect(tagTableViewController?.view).toNot(beNil())
//            }
//        }
//        
//        describe("number of sections"){
//            it ("should be equal to 1"){
//                expect(tagTableViewController.numberOfSections(in: tagTableViewController.view as! UITableView)).to(equal(1))
//            }
//        }
//        describe("rows in table"){
//            it("is equal to the number of tags"){
//                let tagViewModel = TagViewModel()
//                expect(tagTableViewController.tableView(tagTableViewController.view as! UITableView, numberOfRowsInSection: 1)).to(equal(tagViewModel.getTagCount()))
//            }
//        }
//    }
//}
