//
//  ReviewsManagerTests.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import GYGExample

class ReviewsManagerTests: XCTestCase {
    var sut: ReviewsManager!
    var serviceMock: APIServiceMock!
    
    override func setUp() {
        serviceMock = APIServiceMock()
        sut = ReviewsManager(service: serviceMock)
    }
    
    func test_when_call_fetch_reviews_and_APIService_returns_valid_data_then_manager_returns_review_list() {
        let managerExpectation = expectation(description: #function)
        let expectedResultCount = 4
        let expectedFirstAuthorName = "a GetYourGuide customer – Germany"
        var managerResult: ReviewsList?
        
        sut.fetchReviews { (result) in
            if case let .success(reviews) = result {
                managerResult = reviews
            } else {
                XCTFail("Result was not a success case.")
            }
            managerExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(managerResult?.reviews.count, expectedResultCount)
            XCTAssertEqual(managerResult?.totalReviewsComments, expectedResultCount)
            XCTAssertEqual(managerResult?.reviews.first?.author, expectedFirstAuthorName)
        }
    }
    
    func test_when_call_fetch_reviews_and_APIService_returns_serviceError_then_manager_returns_serviceError() {
        let managerExpectation = expectation(description: #function)
        var managerResult: ServiceError?
        let expectedResult = ServiceError.couldNotParseObject
        
        serviceMock.serviceError = ServiceError.couldNotParseObject
        
        sut.fetchReviews { (result) in
            if case let .failure(error) = result {
                managerResult = error
            } else {
                XCTFail("Result was not a failure case.")
            }
            managerExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(managerResult?.localizedDescription, expectedResult.localizedDescription)
        }
    }
    
}
