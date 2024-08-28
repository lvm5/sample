//
//  SampleApp.swift
//  Sample
//
//  Created by Leandro Morais on 8/27/24.
//
import SwiftUI
import SwiftData

@main
struct TarefasApp: App {
    // MARK: - Container SwiftData
    let container: ModelContainer
    
    // MARK: - Inicializador
    init() {
        do {
            // Configuração do container do SwiftData
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            container = try ModelContainer(for: Task.self, configurations: config)
        } catch {
            fatalError("Não foi possível configurar o container do SwiftData: \(error)")
        }
    }
    
    // MARK: - Body do App
    var body: some Scene {
        WindowGroup {
            Home()
        }
        .modelContainer(container)
    }
}
