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
        if songs.count > 0 && withinRangeOfSongCount(withIndex: indexPath.row){
            return songs[indexPath.row].name
        }
        return nil
    }
    
    func getSongDescription(at indexPath: IndexPath) -> String? {
        if songs.count > 0 && withinRangeOfSongCount(withIndex: indexPath.row) {
            return songs[indexPath.row].description
        } 
        return nil
    }
    
    func getCoverArt(at indexPath: IndexPath) -> Data? {
        if songs.count > 0, withinRangeOfSongCount(withIndex: indexPath.row) {
            if let imageData = try? Data(contentsOf: (songs[indexPath.row].coverURL.asURL())) {
                return imageData
            }
        }
        return nil
    }
    
    private func setRoute(forSongs songs: [Int]) {
        if songs.count > 0 {
            route = "\(route)?"
            for song in songs {
                route = "\(route)id=\(song)&"
            }
            removeExtraAmperand()        
        }
    }
    
    private func withinRangeOfSongCount(withIndex index: Int) -> Bool {
        if index <= songs.count && index >= 0 {
            return true
        }
        return false
    }
    
    private func removeExtraAmperand() {
        route = String(route.characters.dropLast())
    }
    
    private func getSongs() {
        MusicService().fetchSongs(withEndpoint: route) { response in
            let songs = response 
            self.songs = self.sortSongsByID(withSongs: songs)
        }
    }
    
    private func sortSongsByID(withSongs songs: [Song]) -> [Song] {
        return songs.sorted { Int($0.id)! < Int($1.id)! }
    }
}
