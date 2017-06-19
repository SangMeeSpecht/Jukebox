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
//    var jsonObj: JSON?
    var tags: [Tag]?
    func fetchData(forRoute route: String, withIDs ids: [String]? = nil, handler: @escaping ([DataObjectMaker]) -> Void) {
        
        var music: [DataObjectMaker] = []
        if route == "/api/1/tags" {
            createTags {response in
                handler(response) 
            }
        } else if foundMatchForCategory(withURL: route) {
            music = createCategories()!
        } else if foundMatchForSong(withURL: route) {
            if ids == nil {
                music = createSongs()!
            } else {
                music = createSongs(withIDs: ids!)!
            }
        }
//        return music
    }

    private func foundMatchForCategory(withURL URL: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^/api/1/category/tag/\\d{1,}", options: [])
            let matches = regex.matches(in: URL, options: [], range: NSRange(location: 0, length: URL.utf16.count))
            
            if let _ = matches.first {
                return true
            }
        } catch {
            print("bad regex")
        }
        return false
    }

    private func foundMatchForSong(withURL URL: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^/api/1/songs/multi[?]{0,1}(id=\\d{1,}){0,1}(&id=\\d{1,}){0,}", options: [])
            let matches = regex.matches(in: URL, options: [], range: NSRange(location: 0, length: URL.utf16.count))
            
            if let _ = matches.first {
                return true
            }
        } catch {
            print("bad regex")
        }
        return false
    }
    
    private func createTags(handler: @escaping ([Tag]) -> Void) {
//        var jsonObj: JSON?
        retrieveAlamofireData() { response in
            var tags: [Tag] = []
//            jsonObj = response
            
            for (id, title) in response {
                tags.append(Tag(title: String(describing: title), id: id))
            }
            handler(tags)
        }
    }
    
    private func createCategories() -> [Category]? {
        var categories: [Category] = []
        let jsonObj = retrieveData(forPath: findJSONfilePath(forPath: "CategoryData"))
        
        for (id, info) in jsonObj! {
            categories.append(Category(name: String(describing: info["name"]), id: id, songIDs: createSongIDlist(forID: info["songs"])!))
        }
        return categories
    }
    
    public func createSongs(withIDs songID: [String]? = nil) -> [Song]? {
        var songs: [Song] = []
        let jsonObj = retrieveData(forPath: findJSONfilePath(forPath: "SongData"))
        
        if songID == nil {
            for (id, info) in jsonObj! {
                songs.append(Song(name: String(describing: info["name"]), id: id, description: String(describing: info["description"]), coverURL: NSURL(string: String(describing: info["coverURL"]))! as URL))
            }
            return songs
        }
        
        for (id, info) in jsonObj! {
            if (songID?.contains(id))! {
                songs.append(Song(name: String(describing: info["name"]), id: id, description: String(describing: info["description"]), coverURL: NSURL(string: String(describing: info["coverURL"]))! as URL))
            }
        }
        
        return songs 
    }
    
    private func createSongIDlist(forID songs: JSON) -> [Int]? {
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
    
    
    private func findJSONfilePath(forPath: String) -> String {
        return Bundle.main.path(forResource: forPath, ofType: "JSON")!
    }
    
    private func retrieveAlamofireData(handler: @escaping (JSON) -> Void) {
        Alamofire.request("http://localhost:4545/api/1/tags").responseJSON { MBresponse in
            let JSONresponse = JSON(MBresponse.result.value!)
//            self.createTags(jsonObj: JSONresponse)
            handler(JSONresponse)
        }
    }
}
