//
//  07_BlursBlendandMore.swift
//  Drawing
//
//  Created by Joyse Vargas on 3/4/24.
//

import SwiftUI

struct _7_BlursBlendandMore: View {
    var body: some View {
        ZStack{
            Image("Goku")
                .colorMultiply(.red)
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
            
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

#Preview {
    _7_BlursBlendandMore()
}
