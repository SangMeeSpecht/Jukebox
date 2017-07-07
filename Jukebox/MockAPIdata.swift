//
//  TagAPIdata.swift
//  Jukebox
//
//  Created by SangMee Specht on 6/15/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Foundation
import Alamofire

let params: Parameters = [
    "port": 4545,
    "protocol": "http",
    "stubs": [
        tagStub,
        categoryStub,
        rockSongsStub,
        rapSongsStub,
        song1Stub,
        song2Stub,
        song3Stub,
        song4Stub,
        allSongsStub
    ]
]

private let tagStub: Parameters = [
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

private let categoryStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET"
            ]
        ],
        [
            "matches": [
                "path": "/api/1/category/tag/[\\d]+$"
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "Rock",
                        "songs": [1,3,5,6,7,8]
                    ],
                    "2": [
                        "name": "Rap",
                        "songs": [2,4]
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let allSongsStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi"
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "Song1",
                        "description": "1 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "2": [
                        "name": "Song2",
                        "description": "2 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "3": [
                        "name": "Song3",
                        "description": "3 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "4": [
                        "name": "Song4",
                        "description": "4 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "5": [
                        "name": "Song5",
                        "description": "5 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "6": [
                        "name": "Song6",
                        "description": "6 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "7": [
                        "name": "Song7",
                        "description": "7 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "8": [
                        "name": "Song8",
                        "description": "8 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let rockSongsStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": [ "1", "3", "5", "6", "7", "8" ] ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "Song1",
                        "description": "1 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "3": [
                        "name": "Song3",
                        "description": "3 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "5": [
                        "name": "Song5",
                        "description": "5 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "6": [
                        "name": "Song6",
                        "description": "6 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "7": [
                        "name": "Song7",
                        "description": "7 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "8": [
                        "name": "Song8",
                        "description": "8 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let rapSongsStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": [ "2", "4" ] ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "2": [
                        "name": "Song2",
                        "description": "2 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ],
                    "4": [
                        "name": "Song4",
                        "description": "4 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song1Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "1" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "Song1",
                        "description": "1 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song2Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "2" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "2": [
                        "name": "Song2",
                        "description": "2 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song3Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "3" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "3": [
                        "name": "Song3",
                        "description": "3 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song4Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "4" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "4": [
                        "name": "Song4",
                        "description": "4 description",
                        "coverURL": "https://www.smashingmagazine.com/images/music-cd-covers/1-2.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]
