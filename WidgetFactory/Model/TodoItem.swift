//
//  TodoItem.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import Foundation


struct TodoItem: Codable, Identifiable {
    var id: Int
    var todo: String
    var completed: Bool
    var userId: Int
}
