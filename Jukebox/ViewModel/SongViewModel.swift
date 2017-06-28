//
//  SongViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/9/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class SongViewModel {
    private var route = "songs/multi"
    var reloadTableView: ((SongViewModel) -> ())?
    private var songs: [Song] = [] {
        didSet {
            self.reloadTableView?(self)
        }
    }
    
    init(songIDs: [Int]) {
        setRoute(forSongs: songIDs)
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
    
    private func setRoute(forSongs songs: [Int]) {
        route += "?"
        for song in songs {
            route += "id=\(song)&"
        }
        removeLastAmperand()
    }
    
    private func removeLastAmperand() {
        _ = route.characters.dropLast()
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
