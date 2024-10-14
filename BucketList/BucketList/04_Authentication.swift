//
//  04_Authentication.swift
//  BucketList
//
//  Created by Joyse Vargas on 9/10/24.
//

import SwiftUI
import LocalAuthentication

struct _4_Authentication: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        //check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            //it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                //authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    //there was a problem
                }
            }
        }
    }
}


#Preview {
    _4_Authentication()
}
