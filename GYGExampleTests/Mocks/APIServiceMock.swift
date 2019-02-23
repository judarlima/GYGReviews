//
//  APIServiceMock.swift
//  GYGExampleTests
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation
@testable import GYGExample

class APIServiceMock: ServiceProtocol {
    var serviceError: ServiceError? = nil
    
    func requestData(with setup: ServiceSetup, completion: @escaping (Result<Data>) -> Void) {
        guard let error = serviceError else {
            completion(.success(generateData()))
            return
        }
        completion(.failure(error))
    }
    
    private func generateData() -> Data {
        guard let filePath = Bundle.main.path(forResource: "reviews", ofType: "json")
            else { fatalError("Could not mock data!") }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            return jsonData
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
