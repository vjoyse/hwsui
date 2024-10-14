//
//  08_BlendOptions.swift
//  Drawing
//
//  Created by Joyse Vargas on 5/4/24.
//

import SwiftUI

struct _8_BlendOptions: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Image("Goku")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .saturation(Double(amount))
                    .blur(radius: (1-amount) * 20)
                
                /*
                Circle()
//                    .fill(Color.red)
                    .fill(Color(red:1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
//                    .fill(Color.green)
                    .fill(Color(red:0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x:50, y:-80)
                    .blendMode(.screen)
                
                Circle()
//                    .fill(Color.blue)
                    .fill(Color(red:0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
                 */
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    _8_BlendOptions()
}
