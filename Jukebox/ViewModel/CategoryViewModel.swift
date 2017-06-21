//
//  CategoryViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation


class CategoryViewModel {
    private var route: String?
    var tagID: String?
    var reloadTableView: ((CategoryViewModel) -> ())?

    private var categories: [String] = [] {
        didSet {
            self.reloadTableView?(self)
        }
    }

    init() {
        self.getCategoryTitles { response in
            self.categories = response
        }
    }
    
    func getCategoryCount() -> Int {
        return categories.count
    }
    
    func getCategoryTitle(at indexPath: IndexPath) -> String {
        return categories[indexPath.row]
    }
    
    private func getCategoryTitles(handler: @escaping ([String]) -> Void) {
//        change to be dynamic later
        API().fetchData(withEndpoint: "category/tag/3") { response in
            var categoryTitles: [String] = []
            
            for category in response {
                let currentCategory = category as? Category
                categoryTitles.append((currentCategory?.name)!)
            }
            handler(categoryTitles)
        }
    }
}
