//
//  00_Documents_Directory.swift
//  BucketList
//
//  Created by Joyse Vargas on 9/10/24.
//

import SwiftUI

struct _0_Documents_Directory: View {
    var body: some View {
        var loadingState = LoadingState.failed
        
        
        let users = [
            User(firstName: "Arnold", lastName: "Rimmer"),
            User(firstName: "Kristine", lastName: "Kochanski"),
            User(firstName: "David", lastName: "Lister")
        ].sorted()
        
        VStack {
            
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
            
            Text("Hello, world!")
                .onTapGesture {
                    let str = "Test Message"
                    let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        let input = try String(contentsOf: url)
                        print (input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .padding()
    }
}

func getDocumentsDirectory() -> URL {
    //find all possible documents directories for this user.
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    //just send back the first one, which ought to be the only one
    return paths[0]
}

#Preview {
    _0_Documents_Directory()
}
