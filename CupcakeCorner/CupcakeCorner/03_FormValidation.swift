//
//  03_FormValidation.swift
//  CupcakeCorner
//
//  Created by Joyse Vargas on 3/5/24.
//

import SwiftUI

struct _3_FormValidation: View {
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
            //.disabled(username.isEmpty || email.isEmpty)
        }
    }
}

#Preview {
    _3_FormValidation()
}
