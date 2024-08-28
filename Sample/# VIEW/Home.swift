//
//  ContentView.swift
//  Sample
//
//  Created by Leandro Morais on 8/27/24.
//

import SwiftUI
import SwiftData

// MARK: - View
struct Home: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [Task]
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Nova Tarefa")) {
                    HStack {
                        TextField("Digite uma nova tarefa", text: $viewModel.newTaskTitle)
                        Button(action: {
                            viewModel.addTask(context: context)
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                
                Section(header: Text("Tarefas")) {
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    viewModel.toggleTaskCompletion(task)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Lista de Tarefas")
        }
    }
}

// MARK: - Preview
#Preview {
    Home()
}
