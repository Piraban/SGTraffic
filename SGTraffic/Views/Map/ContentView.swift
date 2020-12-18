//
//  ContentView.swift
//  SGTraffic
//
//  Created by tigerspike on 16/12/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var trafficVM = TrafficMapViewModal()
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))


    var trafficItems : [Cameras] {
        return trafficVM.trafficsData.count > 0  ? trafficVM.trafficsData[0].cameras : []
    }
    var body: some View {
        ZStack {
            VStack {
                if(trafficVM.loading){
                    ProgressLoading()
                }else{
                    loadedView()
                }
            }
        }.onAppear(){
            trafficVM.getTrafficList()
        }
    }
}


extension ContentView {
    func loadedView() -> some View {
        VStack {

            //  UIKit Map view customization
//            MapView(centerCoordinate: $centerCoordinate,annotations: trafficItems, selectedPlace: selectedPlace, showingPlaceDetails: showingPlaceDetails )

            Map(coordinateRegion: $coordinateRegion,
                annotationItems: trafficItems) { place in
                MapAnnotation(coordinate: place.coordinate, content:  {
                    PinView(pin: place)
                })
            }.edgesIgnoringSafeArea(.all)

        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
