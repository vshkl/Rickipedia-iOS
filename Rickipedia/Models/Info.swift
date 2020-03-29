//
//  Info.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import Foundation

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}
