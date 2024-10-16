//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Joyse Vargas on 11/10/24.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
