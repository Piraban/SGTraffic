//
//  MapLocationDetailView.swift
//  SGTraffic
//
//  Created by tigerspike on 18/12/20.
//

import SwiftUI

struct AnnotationView: View {
    @Binding var selectedPlace: Cameras
    @Binding var isShown: Bool

    var body: some View {
        ZStack {
            Color("blackOverlay").opacity(0.01) .edgesIgnoringSafeArea(.all)
            VStack {
                CustomImage(url: selectedPlace.image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                VStack(alignment :. leading) {
                    Text("location")
                        .font(.title2)
                        .foregroundColor(.blue)
                    Text("latitude \(selectedPlace.coordinate.latitude)")
                        .font(.body)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding(.leading , 20)
                    Text("longitude \(selectedPlace.coordinate.latitude)")
                        .font(.body)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding(.leading , 20)
                }
            }.padding(.horizontal , 30)
            .onTapGesture {
                self.isShown = false
            }
            .frame(height: 340)
            .background(Color("blackOverlay")) .cornerRadius(20).shadow(radius: 20)
        }.onTapGesture {
            self.isShown = false
        }.background(Color.clear)


    }
}

struct AnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationView(selectedPlace: .constant(Cameras(timestamp: "", image: "", cameraId: "", location: Location(latitude:  1.3598, longitude: 103.8536), imageMetadata: ImageMetadata(height: 25, width: 25))), isShown: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
