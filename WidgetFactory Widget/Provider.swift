//
//  Provider.swift
//  WidgetFactory WidgetExtension
//
//  Created by Bitmorpher 4 on 3/27/23.
//

import SwiftUI
import WidgetKit


struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [.placeholder(id: 0), .placeholder(id: 1)])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                let todos = try await TodoService.shared.getAllTodos()
                let entry = SimpleEntry(date: .now, todos: todos)
                
                completion(entry)
            } catch {
                completion(SimpleEntry(date: .now, todos: [.placeholder(id: 0)]))
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        Task {
            do {
                let todos = try await TodoService.shared.getAllTodos()
                let fiveLatestTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: .now, todos: fiveLatestTodos)
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            } catch {
                let entries = [SimpleEntry(date: .now, todos: [.placeholder(id: 0)])]
                let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 60 * 60 * 30)))
//                completion(SimpleEntry(date: .now, todos: [.placeholder(id: 0)]))
                completion(timeline)
            }
        }
    }
}
