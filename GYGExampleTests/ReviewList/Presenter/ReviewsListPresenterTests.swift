//
//  ReviewsListPresenterTests.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import GYGExample

class ReviewsListPresenterTests: XCTestCase {
    var sut: ReviewsListPresenter!
    var viewController: MockViewController!
    
    override func setUp() {
        sut = ReviewsListPresenter()
        viewController = MockViewController()
        
        sut.viewController = viewController
    }
    
    func test_when_presenter_receives_a_ReviewListModel_then_creates_a_ReviewViewModel_and_displays_on_viewController() {
        let review = ReviewsManagerMock.generateReviewModel()
        let reviewList = ReviewsList(status: false,
                                     totalReviewsComments: 5,
                                     reviews: [review])
        let expectedViewModel = ReviewViewModel(title: review.title!,
                                                author: review.author,
                                                rating: Double(review.rating)!,
                                                message: review.message)
        
        sut.presentReviewsList(reviews: reviewList)
        
        XCTAssertEqual(viewController.presentedViewModel?.first!, expectedViewModel)
        XCTAssertNil(viewController.presentedErrorMessage)
    }
    
    func test_when_presenter_receives_a_ServiceError_then_creates_a_error_message_and_displays_on_viewController() {
        let serviceError = ServiceError.badRequest
        let expectedMessage = ServiceError.badRequest.localizedDescription
        
        sut.presentError(error: serviceError)
        
        XCTAssertEqual(viewController.presentedErrorMessage, expectedMessage)
        XCTAssertNil(viewController.presentedViewModel)
    }
}
