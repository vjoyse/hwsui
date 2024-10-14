//
//  01_Path.swift
//  Drawing
//
//  Created by Joyse Vargas on 8/3/24.
//

import SwiftUI

struct _1_Path: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            //Fix for sharpen corners
//            path.addLine(to: CGPoint(x: 100, y: 300))
        }
        .fill(Color.blue)
        //Alternative round corners
        .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        .stroke(Color.orange, lineWidth: 10)
        //.stroke(Color.orange.opacity(0.25), lineWidth: 10)
    }
}

#Preview {
    _1_Path()
}
