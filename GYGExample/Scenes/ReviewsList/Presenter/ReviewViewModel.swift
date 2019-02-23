//
//  ReviewViewModel.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

struct ReviewViewModel {
    let title: String
    let author: String
    let rating: Double
    let message: String
}

extension ReviewViewModel: Equatable {
    static func ==(lhs: ReviewViewModel, rhs: ReviewViewModel) -> Bool {
        return lhs.author == rhs.author &&
            lhs.message == rhs.message &&
            lhs.rating == rhs.rating &&
            lhs.title == rhs.title
    }
}
