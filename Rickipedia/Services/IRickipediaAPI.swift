//
//  File.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import Foundation

protocol RickipediaAPI {
    func getCharacters(atPage page: Int) -> Any
    func getEpisodes(atPage page: Int) -> Any
    func getLocations(atPage page: Int) -> Any
}
