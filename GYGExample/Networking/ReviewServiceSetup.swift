//
//  ReviewServiceSetup.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

enum ReviewServiceSetup: ServiceSetup {
    case mostPopularBelinTour(query: [String: String])
    
    var endpoint: String {
        switch self {
        case let .mostPopularBelinTour(query):
            let url = APIConstants.baseUrl + APIConstants.Path.berlinAirliftReviews
            return buildUrlString(url, query: query)
        }
    }
    
    private func buildUrlString(_ url: String, query: [String: String]) -> String {
        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let urlString = urlComponents?.url?.absoluteString else { return url }
        return urlString
    }
}
