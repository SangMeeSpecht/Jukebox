//
//  SongTableViewControllerSpec.swift
//  Jukebox
//
//  Created by SangMee Specht on 7/13/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
@testable import Jukebox

class SongCollectionViewControllerSpec: QuickSpec {
    override func spec() {
        var songCollectionVC: SongCollectionViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name:"Main", bundle:nil)
            songCollectionVC = storyboard.instantiateViewController(withIdentifier: "SongCollectionViewController") as! SongCollectionViewController
        }
        
        describe("storyboard") {
            it("loads the view") {
                expect(songCollectionVC?.view).toNot(beNil())
            }
        }
    }
}
