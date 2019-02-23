//
//  Coordinator.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
    var navigationController: UINavigationController { get }
}

class Coordinator: CoordinatorProtocol {
    let navigationController: UINavigationController
    
    func start() {
        let reviewsViewController = ReviewsViewController()
        navigationController.pushViewController(reviewsViewController, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
