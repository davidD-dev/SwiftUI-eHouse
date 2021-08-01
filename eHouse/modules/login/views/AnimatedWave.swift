//
//  AnimatedWave.swift
//  eHouse
//
//  Created by David Deschamps on 01/08/2021.
//

import SwiftUI

struct AnimatedWave: View {
    
    @State private var animated = false
    
    let width: CGFloat
    let heightStartingPont: CGFloat
    let heightEndingPoint: CGFloat
    var waveAmplitude: CGFloat = 100
    var animationDuration: Double = 8
    
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: heightStartingPont))
            // Premiere partie de la vague
            path.addCurve(to: CGPoint(x: width, y: heightStartingPont),
                          control1: CGPoint(x: width * 0.35, y: heightStartingPont + waveAmplitude),
                          control2: CGPoint(x: width * 0.65, y: heightStartingPont - waveAmplitude))
            
            // Seconde partie de la vague
            path.addCurve(to: CGPoint(x: 2 * width, y: heightStartingPont),
                          control1: CGPoint(x: width * 1.35, y: heightStartingPont + waveAmplitude),
                          control2: CGPoint(x: width * 1.65, y: heightStartingPont - waveAmplitude))
            
            path.addLine(to: CGPoint(x: 2 * width, y: heightEndingPoint))
            path.addLine(to: CGPoint(x: 0, y: heightEndingPoint))
            
        }
        .offset(x: animated ? -width : 0)
        .onAppear {
            DispatchQueue.main.async {
                withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                    animated.toggle()
                }
            }

        }
        
    }
}

struct AnimatedWave_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedWave(width: UIScreen.main.bounds.width, heightStartingPont: UIScreen.main.bounds.height / 2, heightEndingPoint: UIScreen.main.bounds.height)
            .foregroundColor(.blue.opacity(0.3))
    }
}
