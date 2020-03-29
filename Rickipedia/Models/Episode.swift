//
//  Episode.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let charactersIds: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case airDate = "air_date"
        case episode = "episode"
        case charactersIds = "characters"
    }
}
