//
//  ContentView.swift
//  Drawing
//
//  Created by Joyse Vargas on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var colorCycle = 0.0
    @State private var insetAmount: CGFloat = 50
    
    var body: some View {
        _9_Animation.Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
//        VStack {
//            _6_ColorCyclingCircle(amount: self.colorCycle)
//                .frame(width: 300, height: 300)
//            Slider(value: $colorCycle)
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
