//
//  NetworkManager.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 21.11.20.
//

import UIKit


typealias AppetizerHandler = (Result<[Appetizer], NetworkError>) -> Void

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func getAppitizers(handler: @escaping AppetizerHandler) {
        let task = URLSession.shared.dataTask(for: .appetizer) { result in
            switch result {
            case .success(let data):
                do {
                    let appetizer = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                    handler(.success(appetizer.request))
                } catch(let error) {
                    print(error)
                    print(error.localizedDescription)
                    handler(.failure(.invalidData))
                }
            case .failure(let error):
                handler(.failure(.networkFailure(error)))
            }
        }
        task.resume()
    }
        
    func loadImage(at url: URL?, handler: @escaping (UIImage?) -> Void) {
        guard let url = url else { return }
        
        let cacheKey = NSString(string: url.absoluteString)

        if let image = cache.object(forKey: cacheKey) {
            print("Got image from cache")
            handler(image)
            return
        }
        print("Got image from the internet")
        let task = URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            guard let data = data, let image = UIImage(data: data) else { return }

            cache.setObject(image, forKey: NSString(string: url.absoluteString))
            handler(image)
        }
        task.resume()
    }

}
