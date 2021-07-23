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
}

struct Info: Codable {
    let directors: [String]
    let releaseDate: Date
    let rating: Double
    let genres: [String]
    let imageUrl: String
    let plot: String
    let rank: Int
    let runningTime: Int
    let actors: [String]
    
    enum CodingKeys: String, CodingKey {
        case directors
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

extension Movie {
    func toAttributeValues() -> [String: AttributeValue] {
        var attributeValues = [String: AttributeValue]()
        attributeValues["year"] = .n(String(year))
        attributeValues["title"] = .s(title)
        attributeValues["info"] = .m(["directors": .ss(info.directors),
                                      "release_date": .s(info.releaseDate.iso8601FractionalSeconds()),
                                      "rating": .n(String(info.rating)),
                                      "genres": .ss(info.genres),
                                      "image_url": .s(info.imageUrl),
                                      "plot":.s(info.plot),
                                      "rank": .n(String(info.rank)),
                                      "running_time_secs": .n(String(info.runningTime)),
                                      "actors": .ss(info.actors)])
        
        return attributeValues
    }
}
