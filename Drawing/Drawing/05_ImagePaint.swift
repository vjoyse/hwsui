//
//  05_ImagePaint.swift
//  Drawing
//
//  Created by Joyse Vargas on 8/3/24.
//

import SwiftUI

struct _5_ImagePaint: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("bg"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), width: 30)
        Capsule()
            .strokeBorder(ImagePaint(image: Image("bg"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}
 
#Preview {
    _5_ImagePaint()
}
