//
//  ReviewsListInteractorTests.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import GYGExample

class ReviewsListPresenterMock: ReviewsListPresenterProtocol {
    var presentedList: ReviewsList?
    var presentedError: ServiceError?
    
    func presentReviewsList(reviews: ReviewsList) {
        presentedList = reviews
    }
    
    func presentError(error: ServiceError) {
        presentedError = error
    }
    
    
}

class ReviewsListInteractorTests: XCTestCase {
    var sut: ReviewsListInteractor!
    var presenter: ReviewsListPresenterMock!
    var manager: ReviewsManagerMock!
    
    override func setUp() {
        presenter = ReviewsListPresenterMock()
        manager = ReviewsManagerMock()
        sut = ReviewsListInteractor(presenter: presenter,
                                    manager: manager)
        
    }
    
    func test_when_call_listReviews_and_manager_returns_a_ReviewsList_model_then_pass_the_model_to_presenter() {
        let expectedQuery = ["count": "1000", "page": "0"]
        let expectedPresentedList = ReviewsManagerMock.generateReviewList()
        
        sut.listReviews()
        
        XCTAssertEqual(manager.interactorQuery!, expectedQuery)
        XCTAssertEqual(presenter.presentedList!, expectedPresentedList)
        XCTAssertNil(presenter.presentedError)
    }
    
    func test_when_call_listReviews_and_manager_returns_a_ServiceError_then_pass_the_error_to_presenter() {
        let expectedQuery = ["count": "1000", "page": "0"]
        let expectedPresentedError = ServiceError.couldNotFindHost
        
        manager.serviceError = ServiceError.couldNotFindHost
        
        sut.listReviews()
        
        XCTAssertEqual(manager.interactorQuery!, expectedQuery)
        XCTAssertEqual(presenter.presentedError!, expectedPresentedError)
        XCTAssertNil(presenter.presentedList)
    }

}
