//
//  APISpec.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/7/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
@testable import Jukebox

class WineModelSpec: QuickSpec {
    override func spec() {
        var APImodel: API?
        
        beforeEach {
            APImodel = Jukebox.API()
        }
        
        describe(".fetchTags") {
            it("returns contents of JSON file") {
                
            }
        }
    }
}
