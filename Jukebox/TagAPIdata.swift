//
//  TagAPIdata.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/15/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import Alamofire

let parameters: Parameters = [
    "port": 4545,
    "protocol": "http",
    "stubs": [
        [
            "predicates": [
                [
                    "equals": [
                        "method": "GET",
                        "path": "/api/1/tags"
                    ]
                ]
            ],
            "responses": [
                [
                    "is": [
                        "body": [
                            "1": "Artists",
                            "2": "Albums",
                            "3": "Genre"
                        ],
                        "headers": [ "content-type": "application/json" ]
                    ]
                ]
            ]
        ]
    ]
]
