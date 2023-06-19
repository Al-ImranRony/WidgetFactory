//
//  ToDoHomeView.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 6/18/23.
//

import SwiftUI
import UIKit


struct ToDoHomeView: View {
    @State var menus: [Menu] = Menu.defaultMenus()
    @State var createdMenus: [Menu] = Menu.createdMenus()
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section {
                        ForEach(menus) { item in
                            MenuItemCell(menu: item)
                        }
                        .listRowSeparator(.hidden)
                        
                        Divider()
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.top, 10)
                        
                        ForEach(createdMenus) { menu in
                            MenuItemCell(menu: menu)
                        }
                        .listRowSeparator(.hidden)
                        .padding(.bottom, 420)
                    }
                }
                .overlay(
                    BarContent()
                        .padding(.trailing, 30)
                        .offset(x: 0, y: -60)
                    , alignment: .topTrailing)
                .navigationTitle(Text("D A I L Y  D O"))
                .listStyle(.grouped)
                .offset(x: 0, y: 20)
                .listRowInsets(EdgeInsets())
            }
            Spacer()
            MenuItemCell(menu: Menu(title: "", icon: "plus", iconColor: "#3498DB", numberOfItems: 0))
                .listRowSeparator(.hidden)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 0))
            Divider()
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, -10)
        }
    }
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
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

struct ToDoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoHomeView()
    }
}
