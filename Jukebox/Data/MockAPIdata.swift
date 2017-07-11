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
                    "1": "ARTISTS",
                    "2": "ALBUMS",
                    "3": "GENRE"
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
                        "name": "ROCK",
                        "songs": [1,3,5,6,7,8]
                    ],
                    "2": [
                        "name": "RAP",
                        "songs": [2,4,9,10,11,12]
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
                        "name": "Rock the Casbah",
                        "description": "The Clash",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/b/bb/The_Clash_Rock_the_Casbah_single_cover.png"
                    ],
                    "3": [
                        "name": "Bohemian Rhapsody",
                        "description": "Queen",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/9/9f/Bohemian_Rhapsody.png"
                    ],
                    "5": [
                        "name": "Sweet Child 'O Mine",
                        "description": "Guns N' Roses",
                        "coverURL": "https://aceplaylist.files.wordpress.com/2010/10/gunsn27roses.jpg"
                    ],
                    "6": [
                        "name": "Stairway to Heaven",
                        "description": "Led Zeppelin",
                        "coverURL": "http://files.splurt-com.webnode.com/200001753-5ce7460168/012_led_zeppelin_stairway_to_heaven_c.jpg"
                    ],
                    "7": [
                        "name": "Space Oddity",
                        "description": "David Bowie",
                        "coverURL": "https://images-na.ssl-images-amazon.com/images/I/61znZQzQ6jL.jpg"
                    ],
                    "8": [
                        "name": "Walk This Way",
                        "description": "Aerosmith",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/thumb/9/93/Walkthisway_aero.jpg/220px-Walkthisway_aero.jpg"
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
                "query": [ "id": [ "2", "4", "9", "10", "11", "12" ] ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "2": [
                        "name": "Drop It Like It's Hot",
                        "description": "Snoop Dogg",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/8/83/SnoopDoggDILIH.jpg"
                    ],
                    "4": [
                        "name": "Straight Outta Compton",
                        "description": "N.W.A.",
                        "coverURL": "https://images.rapgenius.com/4515410e482b8729db0f738edb14dc71.1000x1000x1.jpg"
                    ],
                    "9": [
                        "name": "Nuthin but a G Thang",
                        "description": "Dr. Dre",
                        "coverURL": "http://thedrop.fm/files/2013/03/Chronic.jpeg"
                    ],
                    "10": [
                        "name": "N.Y. State of Mind",
                        "description": "Nas",
                        "coverURL": "https://i.ytimg.com/vi/UKjj4hk0pV4/hqdefault.jpg"
                    ],
                    "11": [
                        "name": "California Love",
                        "description": "Tupac Shakur",
                        "coverURL": ""
                    ],
                    "12": [
                        "name": "Gangsta's Paradise",
                        "description": "Coolio",
                        "coverURL": "https://img.discogs.com/f5zg-KTh_oPNysed_3ZU3tpAfVE=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1410402-1387664781-5828.jpeg.jpg"
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
