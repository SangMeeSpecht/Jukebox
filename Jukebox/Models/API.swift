//
//  API.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/7/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import SwiftyJSON

class API {
    func fetchTags() {
        var tags: [Any]?
        let path = Bundle.main.path(forResource: "SongData", ofType: "JSON")
            let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
            let jsonObj = JSON(data: data as Data)

            print(jsonObj)
    }
}
