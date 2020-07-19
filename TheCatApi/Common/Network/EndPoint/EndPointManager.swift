//
//  EndPointManager.swift
//  TheCatApiImplementation
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum Api {
    
    case breeds(page:Int)
    case image(id: String)
    case search
}

extension Api: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.thecatapi.com/v1/"
        case .qa: return "https://api.thecatapi.com/v1/"
        case .staging: return "https://api.thecatapi.com/v1/"
        }
    }
    
    var environmentBasekey: String{
        switch NetworkManager.environment {
        default:
            return "95a9d65b-7a91-4f9c-b7b1-64dc72da08a4"
        }
    }
      
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .breeds:
            return "breeds"
        case .image:
            return "images/search"
        case .search:
            return "images/search"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .breeds, .image, .search:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .breeds(let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page":page,
                                                      "limit":10])
        case .image(let id):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["breed_ids": id,
                                                      "include_breeds":"false"])

        case .search:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["has_breeds":1])
        }
    }
    
    var headers: HTTPHeaders? {
        return ["x-api-key":environmentBasekey,
                "Content-Type":"application/json"]
    }
}

