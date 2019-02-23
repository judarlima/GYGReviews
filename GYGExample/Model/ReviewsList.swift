//
//  ReviewsList.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct ReviewsList {
    let status: Bool
    let totalReviewsComments: Int
    let reviews: [Review]
}

extension ReviewsList: Decodable {
    enum CodingKeys: String, CodingKey {
        case status
        case totalReviewsComments = "total_reviews_comments"
        case reviews = "data"
    }
}

extension ReviewsList: Equatable {
    static func ==(lhs: ReviewsList, rhs: ReviewsList) -> Bool {
        return lhs.status == rhs.status &&
            lhs.totalReviewsComments == rhs.totalReviewsComments &&
            lhs.reviews == rhs.reviews
    }
}
