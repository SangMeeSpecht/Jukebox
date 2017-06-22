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
    
    func getCategoryTitle(at indexPath: IndexPath) -> String {
        return categories[indexPath.row].name!
    }
    
    private func getCategories() {
        API().fetchData(withEndpoint: "category/tag/3") { response in
            self.categories = response as! [Category]
        }
    }
}
