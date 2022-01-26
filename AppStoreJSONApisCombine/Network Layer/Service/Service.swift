//
//  Service.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 19/08/21.
//

import Foundation
import Combine

typealias AppResults = Swift.Result<[Result], Error>

final class Service {
    
    static let shared = Service()
    
    func fetchApps() -> AnyPublisher<[Result], Error> {
        let urlString = "https://itunes.apple.com/search?term=instragram&entity=software"
        guard let url = URL(string: urlString)
        else {
            fatalError()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
