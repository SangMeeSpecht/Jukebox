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
    private var route = "category/tag/3"
    var tagID: String?
    var reloadTableView: ((CategoryViewModel) -> ())?

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
        if categories.count > 0 {
            return categories[indexPath.row].name
        } else {
            return nil
        }
    }
    
    func getSongIDs(at indexPath: IndexPath) -> [Int]? {
        if categories.count > 0 {
            return categories[indexPath.row].songIDs!
        } else {
            return nil
        }
    }
    
    private func getCategories() {
        API().fetchCategories(withEndpoint: route) { response in
            let categories = response 
            self.categories = self.sortCategoriesByID(withCategories: categories)
        }
    }
    
    private func sortCategoriesByID(withCategories categories: [Category]) -> [Category] {
        return categories.sorted { Int($0.id!)! < Int($1.id!)! }
    }
}
