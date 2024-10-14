//
//  02_Loading_View.swift
//  BucketList
//
//  Created by Joyse Vargas on 8/10/24.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed")
    }
}
