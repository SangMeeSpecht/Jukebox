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

class APISpec: QuickSpec {
    override func spec() {
        var APImodel: API?
        
        beforeEach {
            APImodel = Jukebox.API()
        }
        
        describe(".fetchData") {
            context("when a request for all tags is made") {
                it("returns a collection of tags") {
                    let tags = APImodel?.fetchData(forRoute: "/api/1/tags")
                    expect(tags?.count).to(equal(3))
                }
            }
            
            context("when a request for no song categories is made") {
                it("returns an empty collection of song genre categories") {
                    let categories = APImodel?.fetchData(forRoute: "/api/1/category/tag/")
                    expect(categories?.count).to(equal(0))
                }
            }
            
            context("when a request for song categories is made") {
                it("returns a collection of song genre categories") {
                    let tagID = 1
                    let categories = APImodel?.fetchData(forRoute: "/api/1/category/tag/\(tagID)")
                    expect(categories?.count).to(equal(2))
                }
            }
            
            context("when a request for no specific songs is made") {
                it("returns a collection of all songs") {
                    let songs = APImodel?.fetchData(forRoute: "/api/1/songs/multi")
                    expect(songs?.count).to(equal(4))
                }
            }
            
            context("when a request for one song is made") {
                it("returns a collection of one song") {
                    let songs = APImodel?.fetchData(forRoute: "/api/1/songs/multi?id=1", withIDs: ["1"])
                    expect(songs?.count).to(equal(1))
                }
            }
            
            context("when a request for two songs is made") {
                it("returns a collection of two songs") {
                    let songs = APImodel?.fetchData(forRoute: "/api/1/songs/multi?id=1?id=4", withIDs: ["1", "4"])
                    expect(songs?.count).to(equal(2))
                }
            }
            
            context("when a request for a song that isn't in the collection is made") {
                it("returns an empty collection of songs") {
                    let songs = APImodel?.fetchData(forRoute: "/api/1/songs/multi?id=1234567", withIDs: ["1234567"])
                    expect(songs?.count).to(equal(0))
                }
            }
        }
    }
}
