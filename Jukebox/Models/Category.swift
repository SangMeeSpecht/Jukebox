//
//  File.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/7/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class Category {
    let name: String
    let id: String
    let songIDs: [Int]
    
    init(name: String, id: String, songIDs: [Int]) {
        self.name = name
        self.id = id
        self.songIDs = songIDs
    }
}
