//
//  ToDoHomeView.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 6/18/23.
//

import SwiftUI


struct ToDoHomeView: View {
    @State var menus: [Menu] = Menu.defaultMenus()
    @State var createdMenus: [Menu] = Menu.createdMenus()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(menus) { item in
                        MenuItem(menu: item)
                    }
                    .listRowSeparator(.hidden)
                }
                Divider()
                Section {
                    ForEach(createdMenus) { menu in
                        MenuItem(menu: menu)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .overlay(
                BarContent()
                .padding(.trailing, 30)
                .offset(x: 0, y: -60)
            , alignment: .topTrailing)
            
            .navigationTitle("D A I L Y  D O")
            .listStyle(.grouped)
            .offset(x: 0, y: 20)
        }
    }
}

struct BarContent: View {
    var body: some View {
//        Button {
//            print("Search tapped !")
//        } label: {
//            Image(systemName: "magnifyingglass")
//        }
        Image(systemName: "person.crop.circle.dashed")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .tint(.mint)
    }
}

struct MenuItem: View {
    let menu: Menu
    
    var body: some View {
        HStack {
            Image(systemName: menu.icon)
            Text(menu.title)
            Spacer()
            Text(menu.numberOfItems > 0 ? "\(menu.numberOfItems)" : "")
        }
    }
}

struct ToDoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoHomeView()
    }
}
