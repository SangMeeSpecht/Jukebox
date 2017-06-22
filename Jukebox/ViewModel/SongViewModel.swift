//
//  SongViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/9/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class SongViewModel {
    var route = "songs/multi"
    private var songs: [Song] = []
    
    init() {
        getSongs()
    }
    
    func getSongCount() -> Int {
        return songs.count 
    }
    
    func getSongName(at indexPath: IndexPath) -> String? {
        if songs.count > 0 {
            return songs[indexPath.row].name
        } else {
            return nil
        }
    }
    
    func getSongDescription(at indexPath: IndexPath) -> String? {
        if songs.count > 0 {
            return songs[indexPath.row].description
        } else {
            return nil
        }
    }
    
    func getCoverArtURL(at indexPath: IndexPath) -> URL? {
        if songs.count > 0 {
            return songs[indexPath.row].coverURL
        } else {
            return nil
        }
    }
    
    private func getSongs() {
        API().fetchData(withEndpoint: route) { response in
            let songs = response as! [Song]
            self.songs = self.sortSongsByID(withSongs: songs)
        }
    }
    
    private func sortSongsByID(withSongs songs: [Song]) -> [Song] {
        return songs.sorted { Int($0.id!)! < Int($1.id!)! }
    }
}
