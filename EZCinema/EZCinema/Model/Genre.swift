//
//  Genre.swift
//  EZCinema
//
//  Created by Edu on 18/07/21.
//

import Foundation

struct Genre: Codable {
    
    var mID: Int?
    var mName: String?
    
    enum CodingKeys: String, CodingKey {
        
        case mID = "id"
        case mName = "name"
    }
}

struct ResponseGenreList : Codable {
    
    var mGenreList: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case mGenreList = "genres"
    }
}
