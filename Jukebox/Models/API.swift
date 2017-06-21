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
    func fetchData(withEndpoint endpoint: String, withIDs ids: [String]? = nil, handler: @escaping ([DataObjectMaker]) -> Void) {
        if endpoint == "tags" {
            createTags { response in handler(response) }
        } else if foundMatchForCategory(withURL: endpoint) {
            createCategories(withURL: endpoint) { response in handler(response) }
        } else if foundMatchForSong(withURL: endpoint) {
            createSongs(withQueries: endpoint) { response in handler(response) }
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
    
    private func createCategories(withURL URL: String, handler: @escaping ([Category]) -> Void) {
        retrieveAlamofireData(withEndPoint: URL) { response in
            var categories: [Category] = []
            
            for (id, info) in response {
                categories.append(Category(name: String(describing: info["name"]), id: id, songIDs: self.createSongIDlist(forID: info["songs"])!))
            }
            handler(categories)
        }
    }
    
    private func createSongs(withQueries queries: String, handler: @escaping ([Song]) -> Void) {
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
    
    private func retrieveAlamofireData(withEndPoint: String, handler: @escaping (JSON) -> Void) {
        Alamofire.request("http://localhost:4545/api/1/" + withEndPoint).responseJSON { MBresponse in
            if let JSONresponse = MBresponse.result.value {
                handler(JSON(JSONresponse))
            }
        }
    }
}
