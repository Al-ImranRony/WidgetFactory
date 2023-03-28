//
//  TodoView.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 3/26/23.
//

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
        .sheet(item: $selectedTodo) { todo in
            GroupBox {
                VStack(alignment: .leading) {
                    Text(todo.todo)
                        .font(.headline)
                    
                    Text(todo.completed ? "Completed" : "Open")
                        .font(.subheadline)
                }
            } label: {
                Label("Todo: \(todo.id)", systemImage: "person")
            }
            .padding()
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
