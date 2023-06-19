//
//  MenuList.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 6/18/23.
//

import Foundation
import UIKit


struct Menu: Codable, Hashable, Identifiable {
    let id = UUID()
    
    var title: String
    var icon: String
    var iconColor: String
    var numberOfItems: Int
    
    static func defaultMenus() -> [Menu] {
        return [Menu(title: "Do Today", icon: "calendar.day.timeline.right", iconColor: "#026C47", numberOfItems: 0),
                Menu(title: "Starred", icon: "star.square", iconColor: "#441587", numberOfItems: 0),
                Menu(title: "Event", icon: "heart.text.square", iconColor: "#780909", numberOfItems: 0),
                Menu(title: "Reminder", icon: "deskclock", iconColor: "#0C2965", numberOfItems: 0),
                Menu(title: "Tasks", icon: "app.badge.checkmark", iconColor: "#441587", numberOfItems: 3),
        ]
    }

    static func createdMenus() -> [Menu] {
        return [Menu(title: "Untitled", icon: "list.triangle", iconColor: "#0C2965", numberOfItems: 0)]
    }
}
