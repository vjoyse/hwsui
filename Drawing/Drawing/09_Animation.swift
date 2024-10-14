//
//  09_Animation.swift
//  Drawing
//
//  Created by Joyse Vargas on 5/4/24.
//

import SwiftUI

struct _9_Animation: View {
    
    struct Trapezoid: Shape{
        var animatableData: CGFloat {
            get { insetAmount }
            set { self.insetAmount = newValue }
        }
        
        var insetAmount: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: rect.maxY))
            path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
            
            return path
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    _9_Animation()
}
