//
//  CoordinatorTests.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import XCTest
@testable import GYGExample

class CoordinatorTests: XCTestCase {
    var sut: Coordinator!
    var navigationController: UINavigationController!

    override func setUp() {
        navigationController = UINavigationController()
        sut = Coordinator(navigationController: navigationController)
    }
    
    func test_when_call_start_then_navigation_push_reviewsViewController() {
        sut.start()
        
        XCTAssertEqual(sut.navigationController, navigationController)
        XCTAssertTrue(
            sut.navigationController.viewControllers.first!.isKind(of: ReviewsViewController.self)
        )
    }

}
