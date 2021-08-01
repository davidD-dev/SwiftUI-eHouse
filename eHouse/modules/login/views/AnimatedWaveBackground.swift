//
//  AnimatedWaveBackground.swift
//  eHouse
//
//  Created by David Deschamps on 01/08/2021.
//

import SwiftUI

struct AnimatedWaveBackground: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                AnimatedWave(width: geo.size.width, heightStartingPont: geo.size.height * 0.65, heightEndingPoint: geo.size.height)
                    .foregroundColor(Color.main.opacity(0.3))
                
                AnimatedWave(width: geo.size.width * 1.2, heightStartingPont: geo.size.height * 0.65, heightEndingPoint: geo.size.height, waveAmplitude: 150, animationDuration: 12)
                    .foregroundColor(Color.main.opacity(0.4))
                
                AnimatedWave(width: geo.size.width * 2, heightStartingPont: geo.size.height * 0.65, heightEndingPoint: geo.size.height, waveAmplitude: 200, animationDuration: 10)
                    .foregroundColor(Color.wave.opacity(0.4))
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct AnimatedWaveBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedWaveBackground()
    }
}
