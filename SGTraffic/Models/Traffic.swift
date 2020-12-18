//
//  Traffic.swift
//  SGTraffic
//
//  Created by tigerspike on 18/12/20.
//

import Foundation
import MapKit

struct ListTrafficItem: Codable {
    let listTraffics: [Traffic]

    enum CodingKeys: String, CodingKey {
        case listTraffics = "items"
    }
}

struct Traffic: Codable {
    var timestamp : String
    var cameras : [Cameras]

    enum CodingKeys: String, CodingKey {
        case timestamp,cameras
    }
}

struct Cameras: Codable,Identifiable {
    var id = UUID()
    var timestamp : String
    var image : String
    var cameraId: String
    var location: Location
    var imageMetadata:  ImageMetadata

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }

    enum CodingKeys: String, CodingKey {
        case timestamp, image
        case cameraId = "camera_id"
        case imageMetadata = "image_metadata"
        case location
    }

}

struct Location: Codable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}

struct ImageMetadata: Codable {
    var height : Int
    var width : Int

    enum CodingKeys: String, CodingKey {
        case height,width
    }
}



