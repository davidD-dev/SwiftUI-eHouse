//
//  LottieView.swift
//  eHouse
//
//  Created by David Deschamps on 05/08/2021.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let animationName : String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        
        let animation = Animation.named(animationName)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType,
                      context: UIViewRepresentableContext<LottieView>) {
        
    }
    
    
}

