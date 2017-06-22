//
//  TagViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation

class TagViewModel {
    var reloadTableView: ((TagViewModel) -> ())?
    private let route = "tags"
    private var tags: [Tag] = [] {
        didSet {
            self.reloadTableView?(self)
        }
    }
    
    init() {
        getTags()
    }
    
    func getTagCount() -> Int {
        return tags.count
    }
    
    func getTagTitle(at indexPath: IndexPath) -> String {
        return tags[indexPath.row].title!
    }
    
    func getTagID(at indexPath: IndexPath) -> String {
        return tags[indexPath.row].id!
    }
    
    private func getTags() -> Void {
        API().fetchData(withEndpoint: route) { response in
            self.tags = response as! [Tag]
        }
    }
}
