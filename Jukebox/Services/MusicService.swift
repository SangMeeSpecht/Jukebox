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

class MusicService {
    func fetchTags(withEndpoint endpoint: String, handler: @escaping ([Tag]) -> Void) {
        createTags { response in handler(response) }
    }
    
    func fetchCategories(withEndpoint endpoint: String, handler: @escaping ([Category]) -> Void) {
        createCategories(withURL: endpoint) { response in handler(response) }
    }
    
    func fetchSongs(withEndpoint endpoint: String, handler: @escaping ([Song]) -> Void) {
        createSongs(withQueries: endpoint) { response in handler(response) }
    }
    
    private func createTags(handler: @escaping ([Tag]) -> Void) {
        fetchStubbedData(withEndPoint: "tags") { response in
            var tags: [Tag] = []
            
            for (id, title) in response {
                tags.append(Tag(title: String(describing: title), id: id))
            }
            handler(tags)
        }
    }
    
    private func createCategories(withURL URL: String, handler: @escaping ([Category]) -> Void) {
        fetchStubbedData(withEndPoint: URL) { response in
            var categories: [Category] = []
            
            for (id, info) in response {
                categories.append(Category(name: String(describing: info["name"]), id: id, songIDs: self.createSongIDlist(forID: info["songs"])!))
            }
            handler(categories)
        }
    }
    
    private func createSongs(withQueries queries: String, handler: @escaping ([Song]) -> Void) {
        fetchStubbedData(withEndPoint: queries) { response in
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
    
    private func fetchStubbedData(withEndPoint: String, handler: @escaping (JSON) -> Void) {
        Alamofire.request("http://\(privateIpAddress):4545/api/1/\(withEndPoint)").responseJSON { MBresponse in
            if let JSONresponse = MBresponse.result.value {
                handler(JSON(JSONresponse))
            }
        }
    }
}
