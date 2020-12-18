//
//  SGTrafficService.swift
//  SGTraffic
//
//  Created by tigerspike on 16/12/20.
//

import Foundation
import Combine

enum SGTrafficService {
    static let apiSession = APISession()
    static let baseUrl = URL(string: BASEURL)!
}

enum APIPath: String {
    case listTraffics = "traffic-images"
}

extension SGTrafficService {

    static func getAllTrafics(_ path: APIPath) -> AnyPublisher<ListTrafficItem, APIError> {
        let today = Date().covertDateTime()
        let URIPath = path.rawValue 
        var component = URLComponents(url: baseUrl.appendingPathComponent(URIPath), resolvingAgainstBaseURL: true)
        component?.queryItems = [
            URLQueryItem(name: "date_time", value: today),
        ]
        guard let components = component
        else { fatalError("Couldn't create URLComponents") }

        let request = URLRequest(url: components.url!)

        return apiSession.get(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }

}
