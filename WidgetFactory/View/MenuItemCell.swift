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
                .padding(.trailing)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color(hex: menu.iconColor))
            Text(menu.title)
            Spacer()
            Text(menu.numberOfItems > 0 ? "\(menu.numberOfItems)" : "")
                .padding(.trailing, 15)
        }
    }
}

struct MenuItemCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCell(menu: Menu(title: "", icon: "", iconColor: "", numberOfItems: 0))
    }
}
