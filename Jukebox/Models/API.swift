//
//  API.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/7/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class API {
//    work in progress
    func fetchJSON(forRoute route: String) -> JSON {
        var json: JSON?
        if route == "/api/1/tags" {
            json = retrieveData(forPath: findJSONfilePath(forPath: "TagData"))
        }
        return json!
    }
    
    func createTags() -> [Tag]? {
        var tags: [Tag] = []
        let jsonObj = retrieveData(forPath: findJSONfilePath(forPath: "TagData"))
        
        for (id, title) in jsonObj! {
            tags.append(Tag(title: String(describing: title), id: id))
        }
        
        return tags
    }
    
    func createCategories() -> [Category]? {
        var categories: [Category] = []
        let jsonObj = retrieveData(forPath: findJSONfilePath(forPath: "CategoryData"))
        
        for (id, info) in jsonObj! {
            categories.append(Category(name: String(describing: info["name"]), id: id, songIDs: addSongs(forID: info["songs"])!))
        }
        return categories
    }
    
    func createSongs() -> [Song]? {
        var songs: [Song] = []
        let jsonObj = retrieveData(forPath: findJSONfilePath(forPath: "SongData"))
        
        for (id, info) in jsonObj! {
            songs.append(Song(name: String(describing: info["name"]), id: id, description: String(describing: info["description"]), coverURL: NSURL(string: String(describing: info["coverURL"]))! as URL))
        }
        
        return songs 
    }
    
    private func addSongs(forID songs: JSON) -> [Int]? {
        var songList = [Int]()
        
        for (_, song) in songs {
            songList.append(Int(String(describing: song))!)
        }
        
        return songList
    }
    
    private func retrieveData(forPath path: String) -> JSON? {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let jsonObj = JSON(data: data as Data)
            return jsonObj
        } catch {
            print("unable to parse JSON file")
        }
        return nil
    }
    
    private func findJSONfilePath(forPath : String) -> String {
        return Bundle.main.path(forResource: forPath, ofType: "JSON")!
    }
}
