//
//  SearchResults.swift
//  Photogallery
//
//  Created by Roman Oliinyk on 06.09.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import Foundation

struct SearchResults: Decodable {
    
    let total: Int
    let results: [UnsplashPhoto]
    
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue:String]
    
    
    enum URLKind: String {
        case raw, full, regular, small, thumb
    }
}
