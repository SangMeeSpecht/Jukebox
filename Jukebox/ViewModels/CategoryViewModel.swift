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
    var tagID: String?
//    make route dynamic later
    private var route = "category/tag/3"
    private var service: MusicService!


    init(service: MusicService) {
        self.service = service
        getCategories()
    }
    
    func getNavTitle() -> String {
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
    
    private func sortCategoriesByID(withCategories categories: [Category]) -> [Category] {
        return categories.sorted { Int($0.id)! < Int($1.id)! }
    }
}
