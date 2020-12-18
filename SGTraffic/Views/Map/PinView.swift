//
//  PinView.swift
//  SGTraffic
//
//  Created by tigerspike on 18/12/20.
//

import SwiftUI
import MapKit

struct PinView: View {
    @State private var showDetailAnnotation = false
    @State var pin: Cameras

    var body: some View {
        Button(action: {
            showDetailAnnotation.toggle()
        }) {
            Image(systemName: "mappin")
                .padding()
                .foregroundColor(.red)
                .font(.title)
        }
        .sheet(isPresented: $showDetailAnnotation,
               content: {
                AnnotationView(selectedPlace: self.$pin, isShown: self.$showDetailAnnotation)
               })
    }}

struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView(pin:  Cameras(timestamp: "", image: "", cameraId: "", location: Location(latitude:  1.3598, longitude: 103.8536), imageMetadata: ImageMetadata(height: 25, width: 25)))
    }
}
