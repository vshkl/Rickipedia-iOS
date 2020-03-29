//
//  Episode.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import Foundation

// MARK: - Character

struct Character {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterLocation
    let location: CharacterLocation
    let image: String
    let episodesIds: [String]
    
    init(id: Int, name :String, status: String, species: String, type: String, gender: String,
         origin: CharacterLocation, location: CharacterLocation, image: String, episodesIds: [String]) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episodesIds = episodesIds
    }
}

extension Character: Decodable {
    enum CharacterCodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"
        case origin = "origin"
        case location = "location"
        case image = "image"
        case episodesIds = "episode"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CharacterCodingKeys.self)
        
        let id = try container.decode(Int.self, forKey: CharacterCodingKeys.id)
        let name = try container.decode(String.self, forKey: CharacterCodingKeys.name)
        let status = try container.decode(String.self, forKey: CharacterCodingKeys.status)
        let species = try container.decode(String.self, forKey: CharacterCodingKeys.species)
        let type = try container.decode(String.self, forKey: CharacterCodingKeys.type)
        let gender = try container.decode(String.self, forKey: CharacterCodingKeys.gender)
        let origin = try container.decode(CharacterLocation.self, forKey: CharacterCodingKeys.origin)
        let location = try container.decode(CharacterLocation.self, forKey: CharacterCodingKeys.location)
        let image = try container.decode(String.self, forKey: CharacterCodingKeys.image)
        let episodesIds = try container.decode([String].self, forKey: CharacterCodingKeys.episodesIds)
        
        self.init(id: id, name: name, status: status, species: species, type: type, gender: gender,
                  origin: origin, location: location, image: image, episodesIds: episodesIds)
    }
}

// MARK: - CharacterLocation

struct CharacterLocation {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension CharacterLocation: Decodable {
    enum ChracterLocationCodingKeys: String, CodingKey {
        case id = "url"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ChracterLocationCodingKeys.self)
        
        let id = try container.decode(String.self, forKey: ChracterLocationCodingKeys.id)
        let name = try container.decode(String.self, forKey: ChracterLocationCodingKeys.name)
        
        self.init(id: id, name: name)
    }
}
