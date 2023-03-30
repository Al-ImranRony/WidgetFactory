//
//  TodoView.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import Foundation
import SwiftUI

struct TodoView: View {
    @State var todos: [TodoItem] = []
    @State var selectedTodo: TodoItem?
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                Button {
                    selectedTodo = todo
                } label: {
                    Text("\(todo.todo): **\(todo.completed ? "Completed" : "Open")**")
                }
                .buttonStyle(.plain)
            }
            .navigationTitle("Todo List")
            .task {
                do {
                    todos = try await TodoService.shared.getAllTodos()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        .sheet(item: $selectedTodo) { selectedTodoItem in
            GroupBox {
                VStack(alignment: .leading) {
                    Text(selectedTodoItem.todo)
                        .font(.headline)
                    
                    Text("Status: **\(selectedTodoItem.completed ? "Completed" : "Open")**")
                        .font(.subheadline)
                }
            } label: {
                Label("Todo: \(selectedTodoItem.id)", systemImage: "person")
            }
            .padding()
        }
        .onOpenURL { url in
            guard
                url.scheme == "widgetfactory",
                url.host == "todo",
                let id = Int(url.pathComponents[1])
            else {
                return
            }
            Task {
                do {
                    let todo = try await TodoService.shared.getTodo(with: id)
                    DispatchQueue.main.async {
                        selectedTodo = todo
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
