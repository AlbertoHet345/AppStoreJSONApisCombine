//
//  HTTPClient.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation
import Combine

protocol HTTPClient {
    func request<K, R>(for endpoint: Endpoint<K, R>,
                       with requestData: K.RequestData,
                       decoder: JSONDecoder) -> AnyPublisher<R, Error>
}
