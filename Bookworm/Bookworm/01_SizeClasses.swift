//
//  01_SizeClasses.swift
//  Bookworm
//
//  Created by Joyse Vargas on 20/6/24.
//

import SwiftUI

struct _1_SizeClasses: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class: ")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack{
                Text("Active size class: ")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}

#Preview {
    _1_SizeClasses()
}
