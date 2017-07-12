//
//  CategoryViewModel.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/12/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

class CategoryViewModel {
    let categories = MutableProperty<[Category]>([])
    private var categoryID: String?
    private var route = "category/tag/"
    private var service: MusicService!
    private var categoryTitle = [
        "1": "Artists",
        "2": "Albums",
        "3": "Genres"
    ]


    init(service: MusicService, categoryID: String) {
        self.service = service
        self.categoryID = categoryID
        setRoute(forCategory: categoryID)
        getCategories()
    }
    
    func getNavTitle() -> String {
        if let categoryID = categoryID {
            return categoryTitle[categoryID]!
        }
        return "Categories"
    }
    
    func getCategoryCount() -> Int {
        return categories.value.count
    }
    
    func getCategoryName(at indexPath: IndexPath) -> String? {
        if categories.value.count > 0 && withinRangeOfTagCount(withIndex: indexPath.row){
            return categories.value[indexPath.row].name
        }
        return nil
    }
    
    func getSongIDs(at indexPath: IndexPath) -> [Int]? {
        if categories.value.count > 0 && withinRangeOfTagCount(withIndex: indexPath.row) {
            return categories.value[indexPath.row].songIDs
        }
        return nil
    }
    
    private func withinRangeOfTagCount(withIndex index: Int) -> Bool {
        if index <= categories.value.count && index >= 0 {
            return true
        }
        return false
    }
    
    private func getCategories() {
        MusicService().fetchCategories(withEndpoint: route) { response in
            let categories = response 
            self.categories.value = self.sortCategoriesByID(withCategories: categories)
        }
    }
    
    private func setRoute(forCategory category: String) {
        route = "\(route)\(category)"
    }
    
    private func sortCategoriesByID(withCategories categories: [Category]) -> [Category] {
        return categories.sorted { Int($0.id)! < Int($1.id)! }
    }
}
