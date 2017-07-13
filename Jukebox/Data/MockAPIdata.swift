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
        categoryAlbumStub,
        categoryArtistStub,
        categoryGenreStub,
        rockSongsStub,
        rapSongsStub,
        songCollection1Stub,
        songCollection2Stub,
        song1Stub,
        song2Stub,
        song3Stub,
        song4Stub,
        song5Stub,
        song6Stub,
        song7Stub,
        song8Stub,
        song9Stub,
        song10Stub,
        song11Stub,
        song12Stub,
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

private let categoryArtistStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET"
            ]
        ],
        [
            "matches": [
                "path": "/api/1/category/tag/1"
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "Stevie Nicks",
                        "songs": [13,14,15]
                    ],
                    "2": [
                        "name": "M.I.A.",
                        "songs": [16,17,18]
                    ],
                    "3": [
                        "name": "The Clash",
                        "songs": [1]
                    ],
                    "4": [
                        "name": "Snoop Dogg",
                        "songs": [2]
                    ],
                    "5": [
                        "name": "Queen",
                        "songs": [3]
                    ],
                    "6": [
                        "name": "N.W.A.",
                        "songs": [4]
                    ],
                    "7": [
                        "name": "Guns N' Roses",
                        "songs": [5]
                    ],
                    "8": [
                        "name": "Led Zeppelin",
                        "songs": [6]
                    ],
                    "9": [
                        "name": "David Bowie",
                        "songs": [7]
                    ],
                    "10": [
                        "name": "Aerosmith",
                        "songs": [8]
                    ],
                    "11": [
                        "name": "Dr. Dre",
                        "songs": [9]
                    ],
                    "12": [
                        "name": "Nas",
                        "songs": [10]
                    ],
                    "13": [
                        "name": "Tupac Shakur",
                        "songs": [11]
                    ],
                    "14": [
                        "name": "Coolio",
                        "songs": [12]
                    ],
                    "15": [
                        "name": "ALL SONGS",
                        "songs": []
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let categoryAlbumStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET"
            ]
        ],
        [
            "matches": [
                "path": "/api/1/category/tag/2"
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "Bella Donna",
                        "songs": [13,14,15]
                    ],
                    "2": [
                        "name": "Kala",
                        "songs": [16,17,18]
                    ],
                    "3": [
                        "name": "Combat Rock",
                        "songs": [1]
                    ],
                    "4": [
                        "name": "The Masterpiece",
                        "songs": [2]
                    ],
                    "5": [
                        "name": "A Night at the Opera",
                        "songs": [3]
                    ],
                    "6": [
                        "name": "Straight Outta Compton",
                        "songs": [4]
                    ],
                    "7": [
                        "name": "Appetite for Destruction",
                        "songs": [5]
                    ],
                    "8": [
                        "name": "Led Zeppelin IV",
                        "songs": [6]
                    ],
                    "9": [
                        "name": "David Bowie",
                        "songs": [7]
                    ],
                    "10": [
                        "name": "Toys in the Attic",
                        "songs": [8]
                    ],
                    "11": [
                        "name": "The Chronic",
                        "songs": [9]
                    ],
                    "12": [
                        "name": "Illmatic",
                        "songs": [10]
                    ],
                    "13": [
                        "name": "All Eyez on Me",
                        "songs": [11]
                    ],
                    "14": [
                        "name": "Gangsta's Paradise",
                        "songs": [12]
                    ],
                    "19": [
                        "name": "ALL ALBUMS",
                        "songs": []
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let categoryGenreStub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET"
            ]
        ],
        [
            "matches": [
                "path": "/api/1/category/tag/3"
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "1": [
                        "name": "ROCK",
                        "songs": [1,3,5,6,7,8,13,14,15]
                    ],
                    "2": [
                        "name": "RAP",
                        "songs": [2,4,9,10,11,12,16,17,18]
                    ],
                    "3": [
                        "name": "ALL GENRES",
                        "songs": []
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
                        "name": "Rock the Casbah",
                        "description": "The Clash",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/b/bb/The_Clash_Rock_the_Casbah_single_cover.png"
                    ],
                    "2": [
                        "name": "Drop It Like It's Hot",
                        "description": "Snoop Dogg",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/8/83/SnoopDoggDILIH.jpg"
                    ],
                    "3": [
                        "name": "Bohemian Rhapsody",
                        "description": "Queen",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/9/9f/Bohemian_Rhapsody.png"
                    ],
                    "4": [
                        "name": "Straight Outta Compton",
                        "description": "N.W.A.",
                        "coverURL": "https://images.rapgenius.com/4515410e482b8729db0f738edb14dc71.1000x1000x1.jpg"
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
                    ],
                    "13": [
                        "name": "Kind of Woman",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "14": [
                        "name": "After the Glitter Fades",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "15": [
                        "name": "Edge of Seventeen",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "16": [
                        "name": "BirdFlu",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ],
                    "17": [
                        "name": "20 Dollar",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ],
                    "18": [
                        "name": "Paper Planes",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
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
                "query": [ "id": [ "1", "3", "5", "6", "7", "8", "13", "14", "15" ] ]
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
                    ],
                    "13": [
                        "name": "Kind of Woman",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "14": [
                        "name": "After the Glitter Fades",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "15": [
                        "name": "Edge of Seventeen",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
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
                "query": [ "id": [ "2", "4", "9", "10", "11", "12", "16", "17", "18" ] ]
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
                    ],
                    "16": [
                        "name": "BirdFlu",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ],
                    "17": [
                        "name": "20 Dollar",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ],
                    "18": [
                        "name": "Paper Planes",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let songCollection1Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": [ "13", "14", "15" ] ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "13": [
                        "name": "Kind of Woman",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "14": [
                        "name": "After the Glitter Fades",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ],
                    "15": [
                        "name": "Edge of Seventeen",
                        "description": "Stevie Nicks",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/4/43/Bella_Donna_%28album%29.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let songCollection2Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": [ "16", "17", "18" ] ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "16": [
                        "name": "BirdFlu",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ],
                    "17": [
                        "name": "20 Dollar",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
                    ],
                    "18": [
                        "name": "Paper Planes",
                        "description": "M.I.A.",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/c/cf/M.I.A._-_Kala.png"
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
                        "name": "Rock the Casbah",
                        "description": "The Clash",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/b/bb/The_Clash_Rock_the_Casbah_single_cover.png"
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
                        "name": "Drop It Like It's Hot",
                        "description": "Snoop Dogg",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/8/83/SnoopDoggDILIH.jpg"
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
                        "name": "Bohemian Rhapsody",
                        "description": "Queen",
                        "coverURL": "https://upload.wikimedia.org/wikipedia/en/9/9f/Bohemian_Rhapsody.png"
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
                        "name": "Straight Outta Compton",
                        "description": "N.W.A.",
                        "coverURL": "https://images.rapgenius.com/4515410e482b8729db0f738edb14dc71.1000x1000x1.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song5Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "5" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "5": [
                        "name": "Sweet Child 'O Mine",
                        "description": "Guns N' Roses",
                        "coverURL": "https://aceplaylist.files.wordpress.com/2010/10/gunsn27roses.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song6Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "6" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "6": [
                        "name": "Stairway to Heaven",
                        "description": "Led Zeppelin",
                        "coverURL": "http://files.splurt-com.webnode.com/200001753-5ce7460168/012_led_zeppelin_stairway_to_heaven_c.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song7Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "7" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "7": [
                        "name": "Space Oddity",
                        "description": "David Bowie",
                        "coverURL": "https://images-na.ssl-images-amazon.com/images/I/61znZQzQ6jL.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song8Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "8" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
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

private let song9Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "9" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "9": [
                        "name": "Nuthin but a G Thang",
                        "description": "Dr. Dre",
                        "coverURL": "http://thedrop.fm/files/2013/03/Chronic.jpeg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song10Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "10" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "10": [
                        "name": "N.Y. State of Mind",
                        "description": "Nas",
                        "coverURL": "https://i.ytimg.com/vi/UKjj4hk0pV4/hqdefault.jpg"
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song11Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "11" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
                    "11": [
                        "name": "California Love",
                        "description": "Tupac Shakur",
                        "coverURL": ""
                    ]
                ],
                "headers": [ "content-type": "application/json" ]
            ]
        ]
    ]
]

private let song12Stub: Parameters = [
    "predicates": [
        [
            "equals": [
                "method": "GET",
                "path": "/api/1/songs/multi",
                "query": [ "id": "12" ]
            ]
        ]
    ],
    "responses": [
        [
            "is": [
                "body": [
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
