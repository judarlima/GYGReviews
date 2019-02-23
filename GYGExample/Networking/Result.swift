//
//  Result.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ServiceError)
}
