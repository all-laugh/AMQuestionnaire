//
//  FileManager+DocDir.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/4/22.
//

import Foundation

extension FileManager {
    class var documentsDirectory: URL {
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
