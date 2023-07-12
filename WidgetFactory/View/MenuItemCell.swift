//
//  MenuItemCell.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 6/19/23.
//

import SwiftUI

struct MenuItemCell: View {
    let menu: Menu
    
    var body: some View {
        HStack {
            Image(systemName: menu.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color(hex: menu.iconColor))
                .setShadow()
            Text(menu.title)
            Spacer()
            Text(menu.numberOfItems > 0 ? "\(menu.numberOfItems)" : "")
                .padding(.trailing, 15)
        }
    }
}

struct MenuItemCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCell(menu: Menu(title: "Menu Item", icon: "o.square", iconColor: "#3498DB", numberOfItems: 3))
    }
}
