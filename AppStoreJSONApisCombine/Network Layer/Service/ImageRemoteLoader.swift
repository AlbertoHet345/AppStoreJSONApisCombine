//
//  ImageRemoteLoader.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import Foundation
import Combine
import UIKit

class ImageRemoteLoader {
    private let urlSession: URLSession
    private let cache: NSCache<NSURL, UIImage>
    
    init(urlSession: URLSession = .shared,
         cache: NSCache<NSURL, UIImage> = .init()) {
        self.urlSession = urlSession
        self.cache = cache
    }
    
    func publisher(for url: URL) -> AnyPublisher<UIImage, Error> {
        guard url.scheme == "https" else {
            return Fail(error: URLError(.badURL, userInfo: [
                NSLocalizedFailureErrorKey: """
                Image loading may only be performed over HTTPS
                """,
                NSURLErrorFailingURLErrorKey: url
            ]))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
        if let image = cache.object(forKey: url as NSURL) {
            return Just(image)
                .setFailureType(to: Error.self)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data in
                guard let image = UIImage(data: data) else {
                    throw URLError(.badServerResponse, userInfo: [
                        NSURLErrorFailingURLErrorKey: url
                    ])
                }
                return image
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { [cache] image in
                cache.setObject(image, forKey: url as NSURL)
            })
            .eraseToAnyPublisher()
    }
}
