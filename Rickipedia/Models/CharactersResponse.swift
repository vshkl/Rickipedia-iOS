//
//  Results.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import Foundation

struct CharactersResponse: Decodable {
    let info: Info
    let results: [Character]
}
