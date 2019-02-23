//
//  ReviewsManager.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol ReviewsManagerProtocol {
    func fetchReviews(with params: [String: String], completion: @escaping (Result<[Review]>) -> Void)
}

class ReviewsManager: ReviewsManagerProtocol {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchReviews(with params: [String: String], completion: @escaping (Result<[Review]>) -> Void) {
        service.requestData(with: ReviewServiceSetup.mostPopularBelinTour(query: params)) { (result) in
            switch result{
            case let .success(value):
                print(value)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
