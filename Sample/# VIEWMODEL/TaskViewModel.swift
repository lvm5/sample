//
//  TaskViewModel.swift
//  Sample
//
//  Created by Leandro Morais on 8/27/24.
//

import SwiftUI
import SwiftData

// MARK: - ViewModel
class TaskViewModel: ObservableObject {
    @Published var newTaskTitle: String = ""
    
    func addTask(context: ModelContext) {
        guard !newTaskTitle.isEmpty else { return }
        let task = Task(title: newTaskTitle)
        context.insert(task)
        newTaskTitle = ""
    }
    
    func toggleTaskCompletion(_ task: Task) {
        task.isCompleted.toggle()
    }
}
