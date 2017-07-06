//
//  Song.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/7/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class Song {
    let name: String
    let id: String
    let description: String
    let coverURL: URL
    
    init(name: String, id: String, description: String, coverURL: URL) {
        self.name = name
        self.id = id
        self.description = description
        self.coverURL = coverURL
    }
}
