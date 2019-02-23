//
//  ReviewsManagerMock.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import GYGExample

class ReviewsManagerMock: ReviewsManagerProtocol {
    var interactorQuery: [String: String]?
    var serviceError: ServiceError?
    
    func fetchReviews(with params: [String : String], completion: @escaping (Result<ReviewsList>) -> Void) {
        interactorQuery = params
        guard let error = serviceError else {
            completion(.success(ReviewsManagerMock.generateReviewList()))
            return
        }
        completion(.failure(error))
    }
    
    static func generateReviewList() -> ReviewsList {
        return ReviewsList(status: false, totalReviewsComments: 1, reviews: [generateReviewModel()])
    }
    
    static func generateReviewModel() -> Review {
        return Review(reviewID: 0, rating: "5", title: "Test Title",
                      message: "Test Message", author: "Test Author", foreignLanguage: true,
                      date: "Test Date", languageCode: "Test Language", travelerType: "Test Traveler",
                      reviewerName: "Teste Reviewer", reviewerCountry: "Test Country", reviewerProfilePhoto: "Test Photo",
                      isAnonymous: false, firstInitial: "T")
        
    }

    
}
