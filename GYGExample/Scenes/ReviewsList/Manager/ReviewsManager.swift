//
//  ReviewsManager.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol ReviewsManagerProtocol {
    func fetchReviews(completion: @escaping (Result<ReviewsList>) -> Void)
}

class ReviewsManager: ReviewsManagerProtocol {
    private let service: ServiceProtocol
    private lazy var allReviewsQuery = ["count": "1000", "page": "0"]
    
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchReviews(completion: @escaping (Result<ReviewsList>) -> Void) {
        service.requestData(with: ReviewServiceSetup.mostPopularBelinTour(query: allReviewsQuery)) { (result) in
            switch result{
            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    let reviewsList = try decoder.decode(ReviewsList.self, from: data)
                    completion(.success(reviewsList))
                } catch {
                    completion(.failure(.couldNotParseObject))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
