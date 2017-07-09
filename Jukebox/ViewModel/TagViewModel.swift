//
//  TagViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

class TagViewModel {
    let tags = MutableProperty<[Tag]>([])
    private let route = "tags"
    
    init() {
        getTags()
    }
    
    func getTagCount() -> Int {
        return tags.value.count
    }
    
    func getTagTitle(at indexPath: IndexPath) -> String? {
        if tags.value.count >= 0 && withinRangeOfTagCount(withIndex: indexPath.row)  {
            return tags.value[indexPath.row].title
        }
        return nil
    }
    
    func getTagID(at indexPath: IndexPath) -> String? {
        if tags.value.count > 0 && withinRangeOfTagCount(withIndex: indexPath.row) {
            return tags.value[indexPath.row].id
        }
        return nil
    }
    
    private func withinRangeOfTagCount(withIndex index: Int) -> Bool {
        if index <= tags.value.count && index >= 0 {
            return true
        }
        return false
    }
    
    private func getTags() -> Void {
        API().fetchTags(withEndpoint: route) { response in
            let tags = response 
            self.tags.value = self.sortTagsByID(withTags: tags)
        }
    }
    
    private func sortTagsByID(withTags tags: [Tag]) -> [Tag] {
        return tags.sorted { Int($0.id)! < Int($1.id)! }
    }
}
