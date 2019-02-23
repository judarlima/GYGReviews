//
//  Review.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct Review {
    let reviewID: Int
    let rating: String
    let title: String?
    let message: String
    let author: String
    let foreignLanguage: Bool
    let date: String
    let languageCode: String
    let travelerType: String?
    let reviewerName: String
    let reviewerCountry: String
    let reviewerProfilePhoto: String?
    let isAnonymous: Bool
    let firstInitial: String
}

extension Review: Decodable {
    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case rating, title, message, author, foreignLanguage, date
        case languageCode
        case travelerType = "traveler_type"
        case reviewerName, reviewerCountry, reviewerProfilePhoto, isAnonymous, firstInitial
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        reviewID = try values.decode(Int.self, forKey: .reviewID)
        rating = try values.decode(String.self, forKey: .rating)
        title = try? values.decode(String.self, forKey: .title)
        message = try values.decode(String.self, forKey: .message)
        author = try values.decode(String.self, forKey: .author)
        foreignLanguage = try values.decode(Bool.self, forKey: .foreignLanguage)
        date = try values.decode(String.self, forKey: .date)
        languageCode = try values.decode(String.self, forKey: .languageCode)
        travelerType = try? values.decode(String.self, forKey: .travelerType)
        reviewerName = try values.decode(String.self, forKey: .reviewerName)
        reviewerCountry = try values.decode(String.self, forKey: .reviewerCountry)
        reviewerProfilePhoto = try? values.decode(String.self, forKey: .reviewerProfilePhoto)
        isAnonymous = try values.decode(Bool.self, forKey: .isAnonymous)
        firstInitial = try values.decode(String.self, forKey: .firstInitial)
    }
}

extension Review: Equatable {
    static func ==(lhs: Review, rhs: Review) -> Bool {
        return lhs.reviewID == rhs.reviewID &&
        lhs.rating == rhs.rating &&
        lhs.title == rhs.title &&
        lhs.message == rhs.message &&
        lhs.author == rhs.author &&
        lhs.reviewerName == rhs.reviewerName &&
        lhs.date == rhs.date &&
        lhs.reviewerCountry == rhs.reviewerCountry &&
        lhs.firstInitial == rhs.firstInitial
    }
}
