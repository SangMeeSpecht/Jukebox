//
//  TagViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class TagViewModel {
    private let route = "/api/1/tags"
    private var tags: [String]?
    
    init() {
        setTagTitles()
    }
    
    private func setTagTitles() {
        tags = getTagTitles()
    }
    
    func getTagCount() -> Int {
        return tags!.count
    }
    
    func getTagTitle(at indexPath: IndexPath) -> String {
        return tags![indexPath.row]
    }
    
    private func getTagTitles() -> [String] {
        let tags = API().fetchData(forRoute: route)
        var tagNames: [String] = []
        
        for tag in tags! {
            let currentTag = tag as? Tag
            tagNames.append((currentTag?.title)!)
        }
        
        return tagNames
    }
}
