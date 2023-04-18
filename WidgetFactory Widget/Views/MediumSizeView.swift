//
//  MediumSizeView.swift
//  WidgetFactory WidgetExtension
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import SwiftUI
import WidgetKit


struct MediumSizeView: View {
    var entry: SimpleEntry
     
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                
                Divider()
                
                if let todo = entry.todos.first {
                    VStack(alignment: .leading) {
                        Text("Title: \(todo.todo)")
                            .font(.headline)
                        Text("Status: \(todo.completed ? "Completed" : "Open")")
                            .font(.subheadline)
                    }
                } else {
                    Text("Couldn't find any todo, try again!")
                }
            
                Spacer()
            }
            .padding()
        } label: {
            Label("My todos", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "widge tfactory://todo/\(entry.todos.first?.id ?? 0)"))
    }
}

