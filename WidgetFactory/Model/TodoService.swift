//
//  TodoService.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import Foundation


final class TodoService {
    static let shared = TodoService()
    private let baseURl: String = "https://dummyjson.com/"
    
    var todos = [TodoItem]()
    
    private func fetch<T: Decodable>(from endpoint: String) async throws -> T {
        let urlString = baseURl + endpoint
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }
    
    private func fetchTodos(from endPoint: String, completion: @escaping ([TodoItem]) -> Void) {
        let urlString = baseURl + endPoint
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let todos = parse(json: data)
                completion(todos)
            }
        }
    }
    
    private func parse(json: Data) -> [TodoItem] {
        let decoder = JSONDecoder()

        if let jsonTodos = try? decoder.decode(TodoList.self, from: json) {
            todos = jsonTodos.todos
        }
        return todos
    }
    
    func getAllTodos() async throws -> [TodoItem] {
        fetchTodos(from: "todos/") { todos in
            self.todos = todos
        }//try await fetch(from: "todos/")
        return todos
    }
    
    func getTodo(with id: Int) async throws -> TodoItem {
        let todoItem: TodoItem = try await fetch(from: "todos/\(id)")
        return todoItem
    }
}
