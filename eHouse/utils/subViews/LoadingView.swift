//
//  LoadingView.swift
//  eHouse
//
//  Created by David Deschamps on 05/08/2021.
//

import SwiftUI

struct LoadingView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var show = false
    
    var body: some View {
        VStack() {
            LottieView(animationName: K.AnimationsNames.loadingHouse)
                .frame(width: 260, height: 200)
                .opacity(show ? 1 : 0)
            Text("Loading...")
                .font(.title)
                .bold()
                .padding(.bottom, 20)
                .padding(.leading, 23)
                .opacity(show ? 1 : 0)
        }
        .onAppear {
            withAnimation(.linear(duration: 1).delay(0.2)) {
                show = true
            }
        }
        .background(Color.main
                        .opacity(0.7)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.5), radius: 30, x: 0, y: 30)
                    )
        .offset(x: 0, y: -50)
        .scaleEffect(show ? 1 : 0.5)
        .animation(.spring(response: 0.5, dampingFraction: 0.6))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background((colorScheme == .dark ? Color.white : Color.black).opacity(0.7))
        .ignoresSafeArea(.all)

    }
    
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
