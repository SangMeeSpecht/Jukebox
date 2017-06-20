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
    private let route = "/api/1/tags"
    private var tags: [String] = [] {
        didSet {
            self.reloadTableView?(self)
        }
    }
    
    init() {
        self.getTagTitles { response in
            self.tags = response
        }
    }
    
    func getTagCount() -> Int {
        return tags.count
    }
    
    func getTagTitle(at indexPath: IndexPath) -> String {
        return tags[indexPath.row]
    }
    
//    func getTagID(withTitle title: String) -> String? {
//        let tags = API().fetchData(forRoute: route) {response in
//        }
//        for tag in tags {
//            let currentTag = tag as? Tag
//            if currentTag?.title == title {
//                return currentTag?.id!
//            }
//        }
//        return nil
//    }
    
    private func getTagTitles(handler: @escaping ([String]) -> Void) {
        API().fetchData(forRoute: route) { response in
            var tagNames: [String] = []
            
            for tag in response {
                let currentTag = tag as? Tag
                tagNames.append((currentTag?.title)!)
            }
            
            handler(tagNames)
        }
    }
}
