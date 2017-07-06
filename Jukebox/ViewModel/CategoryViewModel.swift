//
//  CategoryViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation


class CategoryViewModel {
//    change route to be dynamic later
    var tagID: String?
    var reloadTableView: ((CategoryViewModel) -> ())?
    private var route = "category/tag/3"
    private var categories: [Category] = [] {
        didSet {
            self.reloadTableView?(self)
        }
    }

    init() {
        getCategories()
    }
    
    func getCategoryCount() -> Int {
        return categories.count
    }
    
    func getCategoryName(at indexPath: IndexPath) -> String? {
        if categories.count > 0 && withinRangeOfTagCount(withIndex: indexPath.row){
            return categories[indexPath.row].name
        }
        return nil
    }
    
    func getSongIDs(at indexPath: IndexPath) -> [Int]? {
        if categories.count > 0 && withinRangeOfTagCount(withIndex: indexPath.row) {
            return categories[indexPath.row].songIDs
        }
        return nil
    }
    
    private func withinRangeOfTagCount(withIndex index: Int) -> Bool {
        if index <= categories.count && index >= 0 {
            return true
        }
        return false
    }
    
    private func getCategories() {
        API().fetchCategories(withEndpoint: route) { response in
            let categories = response 
            self.categories = self.sortCategoriesByID(withCategories: categories)
        }
    }
    
    private func sortCategoriesByID(withCategories categories: [Category]) -> [Category] {
        return categories.sorted { Int($0.id)! < Int($1.id)! }
    }
}
