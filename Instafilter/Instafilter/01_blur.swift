//
//  01_blur.swift
//  Instafilter
//
//  Created by Joyse Vargas on 10/9/24.
//

import SwiftUI

struct _1_blur: View {
    @State private var blurAmount: CGFloat = 0
    
    var body: some View {
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...20)
        }
    }
}

#Preview {
    _1_blur()
}
