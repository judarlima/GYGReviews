//
//  ReviewsManager.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol ReviewsManagerProtocol {
    func fetchReviews(with params: [String: String], completion: @escaping (Result<ReviewsList>) -> Void)
}

class ReviewsManager: ReviewsManagerProtocol {
    private let service: ServiceProtocol
    typealias Query = [String: String]
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchReviews(with query: Query, completion: @escaping (Result<ReviewsList>) -> Void) {
        service.requestData(with: ReviewServiceSetup.mostPopularBelinTour(query: query)) { (result) in
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
