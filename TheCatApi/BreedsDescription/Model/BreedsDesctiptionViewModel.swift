//
//  CatDesctiptionViewModel.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation

struct BreedModel: Decodable {
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?
    let breeds: [BreedsModel]?
    
    enum BreedsKeys: String, CodingKey {
        case id
        case url
        case width
        case heigth
        case breeds
    }
}
