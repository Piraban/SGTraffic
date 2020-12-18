//
//  API.swift
//  SGTraffic
//
//  Created by tigerspike on 16/12/20.
//

import SwiftUI
import Combine

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String), parserError(reason: String), networkError(from: URLError)

    var errorDescription: String? {
        switch self {
            case .unknown:
                return "Unknown error"
            case .apiError(let reason), .parserError(let reason):
                return reason
            case .networkError(let from):
                return from.localizedDescription
        }
    }
}

struct APISession {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func get<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, APIError> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .print()
            .tryMap {  data , response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.unknown
                }

                switch httpResponse.statusCode {
                    case 200..<300:
                        let value = try JSONDecoder().decode(T.self, from: data)
                        return Response(value: value, response: response)
                    case 401: throw APIError.apiError(reason: "Unauthorized")
                    case 403: throw APIError.apiError(reason: "Unauthorized")
                    case 404: throw APIError.apiError(reason: "Resource not found")
                    case 405..<500: throw APIError.apiError(reason: "client error");
                    case 500..<600: throw APIError.apiError(reason: "server error")
                    default: throw APIError.apiError(reason: "Unknown")
                }
            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                }
                if let urlerror = error as? URLError {
                    return APIError.networkError(from: urlerror)
                }
                return APIError.unknown
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
