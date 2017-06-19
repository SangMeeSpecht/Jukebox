////
////  CategoryViewModel.swift
////  Jukebox
////
////  Created by SangMee Specht on 6/12/17.
////  Copyright © 2017 SangMee Specht. All rights reserved.
////
//
//import Foundation
//
//
//class CategoryViewModel {
//    private var route: String?
//    var tagID: String? 
////        didSet {
////            route = buildRoute()
////        }
////    }
//    private var categories: [String]?
//
//    init() {
//        categories = getCategoryTitles()
//    }
//    
//    func getCategoryCount() -> Int {
//        return categories!.count
//    }
//    
//    func getCategoryTitle(at indexPath: IndexPath) -> String {
//        return categories![indexPath.row]
//    }
//    
//    private func getCategoryTitles() -> [String] {
////        change to be dynamic later
//        let categories = API().fetchData(forRoute: "/api/1/category/tag/1")
//        var categoryTitles: [String] = []
//        
//        for category in categories! {
//            let currentCategory = category as? Category
//            categoryTitles.append((currentCategory?.name)!)
//        }
//        
//        return categoryTitles
//    }
//    
//    private func buildRoute() {
//        
//    }
//}
