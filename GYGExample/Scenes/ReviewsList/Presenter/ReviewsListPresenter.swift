//
//  ReviewsListPresenter.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol ReviewsListPresenterProtocol {
    func presentReviewsList(reviews: ReviewsList)
    func presentError(error: ServiceError)
}

class ReviewsListPresenter: ReviewsListPresenterProtocol {
    weak var viewController: ReviewsDisplayProtocol?
    
    func presentReviewsList(reviews: ReviewsList) {
        let viewModel = reviews.reviews.map { ReviewViewModel(title: $0.title ?? "",
                                                         author: $0.author,
                                                         rating: Double($0.rating) ?? 0,
                                                         message: $0.message) }
        viewController?.displayReviews(viewModel: viewModel)
    }
    
    func presentError(error: ServiceError) {
        viewController?.displayError(message: error.localizedDescription)
    }
}
