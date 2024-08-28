//
//  Task.swift
//  Sample
//
//  Created by Leandro Morais on 8/27/24.
//

import Foundation
import SwiftData

// MARK: - Model
@Model
class Task {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
