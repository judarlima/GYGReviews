//
//  MockViewController.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import GYGExample

class MockViewController: ReviewsDisplayProtocol {
    var presentedViewModel: [ReviewViewModel]?
    var presentedErrorMessage: String?
    
    func displayReviews(viewModel: [ReviewViewModel]) {
        presentedViewModel = viewModel
    }
    
    func displayError(message: String) {
        presentedErrorMessage = message
    }
}

