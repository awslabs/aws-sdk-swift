//
//  File.swift
//  
//
//  Created by Stone, Nicki on 7/21/21.
//

import Foundation
import DynamoDB

struct Movie: Codable {
    let year: Int
    let title: String
    let info: Info
    let releaseDate: Date
    let rating: Int
    let genres: [String]
    let imageUrl: String
    let plot: String
    let rank: Int
    let runningTime: Int
    let actors: [String]
    
    enum CodingKeys: String, CodingKey {
        case year
        case title
        case info
        case releaseDate = "release_date"
        case rating
        case genres
        case imageUrl = "image_url"
        case plot
        case rank
        case runningTime = "running_time_secs"
        case actors
    }
}

struct Info: Codable {
    let directors: [String]
}

extension Movie {
    func toAttributeValues() -> [String: AttributeValue] {
        var attributeValues = [String: AttributeValue]()
        attributeValues["year"] = .n(String(year))
        attributeValues["title"] = .s(title)
        attributeValues["info"] = .m(["directors": .ss(info.directors)])
        attributeValues["releaseDate"] = .s(releaseDate.iso8601FractionalSeconds())
        attributeValues["rating"] = .n(String(rating))
        attributeValues["genres"] = .ss(genres)
        attributeValues["imageUrl"] = .s(imageUrl)
        attributeValues["plot"] = .s(plot)
        attributeValues["rank"] = .n(String(rank))
        attributeValues["runningTime"] = .n(String(runningTime))
        attributeValues["actors"] = .ss(actors)
        return attributeValues
    }
}
