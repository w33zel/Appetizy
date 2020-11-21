//
//  URLSession+Ext.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import Foundation

extension URLSession {
    @discardableResult
    func dataTask(for endpoint: Endpoint, handler: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionDataTask {
        dataTask(with: endpoint.url) { (data, response, error) in
            if let error = error {
                handler(.failure(.networkFailure(error)))
            } else {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    handler(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    handler(.failure(.invalidData))
                    return
                }
                
                handler(.success(data))
            }
        }
    }
}
