//
//  APISpec.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/7/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
import Alamofire
@testable import Jukebox

class APISpec: QuickSpec {
    override func spec() {
        var APImodel: API?
        
        beforeEach {
            APImodel = Jukebox.API()
        }
        
        afterSuite {
            Alamofire.request("http://localhost:2525/imposters/", method: .delete)
        }
        
        describe(".fetchTags") {
            context("when a request for all tags is made") {
                it("returns a collection of tags") {
                    var tags: [Tag] = []
                    APImodel?.fetchTags(withEndpoint: "tags") { response in
                        tags = response
                    }
                    expect(tags.count).toEventually(equal(3))
                }
            }
        }
        
        describe(".fetchCategories") {
            context("when a request for no song categories is made") {
                it("returns an empty collection of song genre categories") {
                    var categories: [Jukebox.Category] = []
                    APImodel?.fetchCategories(withEndpoint: "category/tag/") { response in
                        categories = response
                    }
                    expect(categories.count).toEventually(equal(0))
                }
            }
            
            context("when a request for song categories is made") {
                it("returns a collection of song genre categories") {
                    var categories: [Jukebox.Category] = []
                    let tagID = 1
                    APImodel?.fetchCategories(withEndpoint: "category/tag/\(tagID)") { response in
                        categories = response
                    }
                    expect(categories.count).toEventually(equal(2))
                }
            }
        }
        
        describe(".fetchSongs") {
            context("when a request for no specific songs is made") {
                it("returns a collection of all songs") {
                    var songs: [Song] = []
                    APImodel?.fetchSongs(withEndpoint: "songs/multi") { response in
                        songs = response
                    }
                    expect(songs.count).toEventually(equal(8))
                }
            }
            
            context("when a request for one song is made") {
                it("returns a collection of one song") {
                    var songs: [Song] = []
                    APImodel?.fetchSongs(withEndpoint: "songs/multi?id=1") { response in
                        songs = response
                    }
                    expect(songs.count).toEventually(equal(1))
                }
            }
            
            context("when a request for two songs is made") {
                it("returns a collection of two songs") {
                    var songs: [Song] = []
                    APImodel?.fetchSongs(withEndpoint: "songs/multi?id=2&id=4") { response in
                        songs = response
                    }
                    expect(songs.count).toEventually(equal(2))
                }
            }
            
            context("when a request for two songs is made, but only one song exists") {
                it("returns only the song that exists") {
                    var songs: [Song] = []
                    APImodel?.fetchSongs(withEndpoint: "songs/multi?id=1234567&id=4") { response in
                        songs = response
                    }
                    expect(songs.count).toEventually(equal(1))
                }
            }
            
            context("when a request for a song that isn't in the collection is made") {
                it("returns a collection of all songs") {
                    var songs: [Song] = []
                    APImodel?.fetchSongs(withEndpoint: "songs/multi?id=1234567") { response in
                        songs = response 
                    }
                    expect(songs.count).toEventually(equal(8))
                }
            }
        }
    }
}
