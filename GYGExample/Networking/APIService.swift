//
//  APIService.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func requestData(with setup: ServiceSetup, completion: @escaping (Result<Data>) -> Void)
}

struct APIService: ServiceProtocol {
    
    public func requestData(with setup: ServiceSetup, completion: @escaping (Result<Data>) -> Void) {
        guard let url = URL(string: setup.endpoint) else {
            completion(.failure(.urlNotFound))
            return
        }
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(.unknown(error.localizedDescription)))
                }
                
                guard let data = data else {
                    completion(.failure(.brokenData))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.unknown("Could not cast to HTTPURLResponse object.")))
                    return
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    completion(.success(data))
                    
                case 403:
                    completion(.failure(.authenticationRequired))
                    
                case 404:
                    completion(.failure(.couldNotFindHost))
                    
                case 500:
                    completion(.failure(.badRequest))
                    
                default: break
                }
                }.resume()
        }
    }
}
