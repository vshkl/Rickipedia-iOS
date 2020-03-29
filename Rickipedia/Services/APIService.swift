//
//  APIService.swift
//  Rickipedia
//
//  Created by Pavel Vashkel on 3/29/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import Foundation
import Moya

enum APIService {
    case characters(page: Int)
    case episodes(page: Int)
    case locations(page: Int)
}

extension APIService: TargetType {
    var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api")!
    }
    var path: String {
        switch self {
        case .characters:
            return "/character"
        case .episodes:
            return "/episode"
        case .locations:
            return "/location"
        }
    }
    var method: Moya.Method {
        switch self {
        case .characters, .episodes, .locations:
            return .get
        }
    }
    var sampleData: Data {
        switch self {
        case .characters:
            return "{}".utf8Encoded
        case .episodes:
            return "{}".utf8Encoded
        case .locations:
            return "{}".utf8Encoded
        }
    }
    var task: Task {
        switch self {
        case .characters(let page), .episodes(let page), .locations(let page):
            var params: [String: Any] = [:]
            params["page"] = page
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - Helpers

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
