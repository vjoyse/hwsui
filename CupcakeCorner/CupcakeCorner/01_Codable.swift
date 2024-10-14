//
//  01_Codable.swift
//  CupcakeCorner
//
//  Created by Joyse Vargas on 19/4/24.
//

import SwiftUI

class User: ObservableObject, Codable{
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

enum CodingKeys: CodingKey {
    case name
}

struct _1_Codable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    _1_Codable()
}
