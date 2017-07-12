//
//  SongViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/9/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

class SongViewModel {
    let songs = MutableProperty<[Song]>([])
    private let service: MusicService!
    private var route = "songs/multi"
    
    init(service: MusicService, songIDs: [Int]) {
        self.service = service
        setRoute(forSongs: songIDs)
        getSongs()
    }
    
    func getNavTitle() -> String {
        return "Songs"
    }
    
    func getSongCount() -> Int {
        return songs.value.count
    }
    
    func getSongName(at indexPath: IndexPath) -> String? {
        if songs.value.count > 0 && withinRangeOfSongCount(withIndex: indexPath.row){
            return songs.value[indexPath.row].name
        }
        return nil
    }
    
    func getSongDescription(at indexPath: IndexPath) -> String? {
        if songs.value.count > 0 && withinRangeOfSongCount(withIndex: indexPath.row) {
            return songs.value[indexPath.row].description
        } 
        return nil
    }
    
    func getCoverArt(at indexPath: IndexPath) -> URL? {
        if songs.value.count > 0, withinRangeOfSongCount(withIndex: indexPath.row) {
            let songURL = try? self.songs.value[indexPath.row].coverURL.asURL()
            return songURL
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
        if index <= songs.value.count && index >= 0 {
            return true
        }
        return false
    }
    
    private func removeExtraAmperand() {
        if route.characters.last == "&" {
            route = String(route.characters.dropLast())
        }
    }
    
    private func getSongs() {
        MusicService().fetchSongs(withEndpoint: route) { response in
            let songs = response 
            self.songs.value = self.sortSongsByID(withSongs: songs)
        }
    }
    
    private func sortSongsByID(withSongs songs: [Song]) -> [Song] {
        return songs.sorted { Int($0.id)! < Int($1.id)! }
    }
}
