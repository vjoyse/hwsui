//
//  01_Users_Sorted.swift
//  BucketList
//
//  Created by Joyse Vargas on 7/10/24.
//

import Foundation
struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
