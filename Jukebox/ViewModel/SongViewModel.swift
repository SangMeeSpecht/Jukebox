//
//  SongViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/9/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class SongViewModel {
    var reloadTableView: ((SongViewModel) -> ())?
    private var route = "songs/multi"
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
    
    func getCoverArt(at indexPath: IndexPath) -> Data? {
        if songs.count > 0, let imageData = try? Data(contentsOf: (songs[indexPath.row].coverURL!.asURL())) {
            return imageData
        } else {
            return nil
        }
    }
    
    private func setRoute(forSongs songs: [Int]) {
        if songs.count > 0 {
            route = "\(route)?"
            for song in songs {
                route = "\(route)id=\(song)&"
            }
            removeLastAmperand()        
        }
    }
    
    private func removeLastAmperand() {
        route = String(route.characters.dropLast())
    }
    
    private func getSongs() {
        API().fetchSongs(withEndpoint: route) { response in
            let songs = response 
            self.songs = self.sortSongsByID(withSongs: songs)
        }
    }
    
    private func sortSongsByID(withSongs songs: [Song]) -> [Song] {
        return songs.sorted { Int($0.id!)! < Int($1.id!)! }
    }
}
