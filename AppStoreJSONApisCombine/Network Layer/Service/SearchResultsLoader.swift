//
//  SearchResultsLoader.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation
import Combine

protocol ResultLoader {
    func loadResults(matching query: String) -> AnyPublisher<[Result], Error>
}

struct SearchResultsLoader: ResultLoader {
    private let urlSession = URLSession.shared
    
    func loadResults(matching query: String) -> AnyPublisher<[Result], Error> {
        urlSession.request(for: .search(for: query), with: ())
    }
}

final class SearchResultsLoader2: ResultLoader {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func loadResults(matching query: String) -> AnyPublisher<[Result], Error> {
        client.request(for: .search(for: query),
                          with: (),
                          decoder: .init())
    }
}
