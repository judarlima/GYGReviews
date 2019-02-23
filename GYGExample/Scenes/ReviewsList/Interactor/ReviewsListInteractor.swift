//
//  ReviewsListInteractor.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol ReviewsListInteractorProtocol {
    func listReviews()
}

class ReviewsListInteractor: ReviewsListInteractorProtocol {
    private var presenter: ReviewsListPresenterProtocol?
    private var manager: ReviewsManagerProtocol?
    private var currentPage = 0
    private lazy var query = ["count": "1000",
                              "page": "\(currentPage)"]
    
    init(presenter: ReviewsListPresenterProtocol, manager: ReviewsManagerProtocol) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func listReviews() {
        manager?.fetchReviews(with: query, completion: { [weak self] (result) in
            guard let interactor = self else { return }
            switch result {
            case let .success(reviews):
                interactor.presenter?.presentReviewsList(reviews: reviews)
            case let .failure(error):
                interactor.presenter?.presentError(error: error)
            }
        })
    }    
}
