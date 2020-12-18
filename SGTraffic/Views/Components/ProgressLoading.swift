//
//  ProgressLoading.swift
//  SGTraffic
//
//  Created by tigerspike on 18/12/20.
//

import Foundation
import SwiftUI

struct ProgressLoading: View {
    var body: some View {
        ZStack {
            Color("blackOverlay").opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                BlurView()
                VStack {
                    Indicator()
                    Text("Please wait").foregroundColor(Color.white).padding(.top, 8)
                }
            }.frame(width : 250 , height: 250)
            .cornerRadius(20).shadow(radius: 20)
        }
    }
}


struct ProgressLoading_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLoading()
    }
}

struct BlurView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView{
        let effect = UIBlurEffect(style: .systemMaterialDark)
        let view = UIVisualEffectView(effect: effect)
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {

    }
}

struct Indicator :  UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView{
        let indicate = UIActivityIndicatorView(style: .large)
        indicate.color = UIColor.white
        indicate.startAnimating()
        return indicate
    }


    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
    }
}

