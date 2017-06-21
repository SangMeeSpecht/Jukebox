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
    func fetchData(forRoute route: String, withIDs ids: [String]? = nil, handler: @escaping ([DataObjectMaker]) -> Void) {
        if route == "tags" {
            createTags {response in
                handler(response) 
            }
        } else if foundMatchForCategory(withURL: route) {
            createCategories { response in
                handler(response)
            }
        } else if foundMatchForSong(withURL: route) {
            createSongs(withQueries: route) { response in
                handler(response)
            }
        }
    }

    private func foundMatchForCategory(withURL URL: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^category/tag/\\d{1,}", options: [])
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
            let regex = try NSRegularExpression(pattern: "^songs/multi[?]{0,1}(id=\\d{1,}){0,1}(&id=\\d{1,}){0,}", options: [])
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
        retrieveAlamofireData(withEndPoint: "tags") { response in
            var tags: [Tag] = []
            
            for (id, title) in response {
                tags.append(Tag(title: String(describing: title), id: id))
            }
            handler(tags)
        }
    }
    
    private func createCategories(handler: @escaping ([Category]) -> Void) {
//        change tag id
        retrieveAlamofireData(withEndPoint: "category/tag/3") { response in
            var categories: [Category] = []
            
            for (id, info) in response {
                categories.append(Category(name: String(describing: info["name"]), id: id, songIDs: self.createSongIDlist(forID: info["songs"])!))
            }
            handler(categories)
        }
    }
    
    private func createSongs(withQueries queries: String, handler: @escaping ([Song]) -> Void) {
//        var songs: [Song] = []
//        let jsonObj = retrieveData(forPath: findJSONfilePath(forPath: "SongData"))
//        
//        if songID == nil {
//            for (id, info) in jsonObj! {
//                songs.append(Song(name: String(describing: info["name"]), id: id, description: String(describing: info["description"]), coverURL: NSURL(string: String(describing: info["coverURL"]))! as URL))
//            }
//            return songs
//        }
//        
//        for (id, info) in jsonObj! {
//            if (songID?.contains(id))! {
//                songs.append(Song(name: String(describing: info["name"]), id: id, description: String(describing: info["description"]), coverURL: NSURL(string: String(describing: info["coverURL"]))! as URL))
//            }
//        }
//        
//        return songs 
        
        retrieveAlamofireData(withEndPoint: queries) { response in
            var songs: [Song] = []
            
            for (id, info) in response {
                songs.append(Song(name: String(describing: info["name"]), id: id, description: String(describing: info["description"]), coverURL: NSURL(string: String(describing: info["coverURL"]))! as URL))
            }
            handler(songs)
        }
    }
    
    private func createSongIDlist(forID songs: JSON) -> [Int]? {
        var songList = [Int]()
        
        for (_, song) in songs {
            songList.append(Int(String(describing: song))!)
        }
        
        return songList
    }
    
//    DELETE
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
    
//    DELETE
    private func findJSONfilePath(forPath: String) -> String {
        return Bundle.main.path(forResource: forPath, ofType: "JSON")!
    }
    
    private func retrieveAlamofireData(withEndPoint: String, handler: @escaping (JSON) -> Void) {
        Alamofire.request("http://localhost:4545/api/1/" + withEndPoint).responseJSON { MBresponse in
            if let JSONresponse = MBresponse.result.value {
                handler(JSON(JSONresponse))
            }
        }
    }
}
