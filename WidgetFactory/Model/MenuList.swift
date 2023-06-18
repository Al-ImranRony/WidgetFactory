//
//  MenuList.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 6/18/23.
//

import Foundation


struct Menu: Codable, Hashable, Identifiable {
    let id = UUID()
    
    var title: String
    var icon: String
    var numberOfItems: Int
    
    static func defaultMenus() -> [Menu] {
        return [Menu(title: "My Day", icon: "calendar.day.timeline.right", numberOfItems: 0),
                Menu(title: "Starred", icon: "star.square", numberOfItems: 0),
                Menu(title: "Event", icon: "heart.text.square", numberOfItems: 0),
                Menu(title: "Reminder", icon: "deskclock", numberOfItems: 0),
                Menu(title: "Tasks", icon: "app.badge.checkmark", numberOfItems: 0),
        ]
    }

    static func createdMenus() -> [Menu] {
        return [Menu(title: "Untitled", icon: "list.triangle", numberOfItems: 0)]
    }
}
