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
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
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
                        .padding(.bottom, UIScreen.main.bounds.height/2)
                    }
                }
                .overlay(
                    BarContent()
                        .padding(.trailing, 30)
                        .offset(x: 0, y: -62)
                    , alignment: .topTrailing)
                .navigationTitle(Text("D A I L Y  D O"))
                .listStyle(.grouped)
                .offset(x: 0, y: 20)
                .listRowInsets(EdgeInsets())
            }
            MenuItemCell(menu: Menu(title: "", icon: "plus", iconColor: "#330099", numberOfItems: 0))
                .listRowSeparator(.hidden)
                .listStyle(.grouped)
                .padding(EdgeInsets(top: 10, leading: 18, bottom: 15, trailing: 0))
            Rectangle()
                .frame(height: 0)
                .background(Color.indigo)
                .edgesIgnoringSafeArea(.all)
                .listStyle(.grouped)
        }
    }
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        self.propotionalFrame(width: 0.5, height: 0.3)
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
            .rightAlighnedContent()
            .setShadow()
    }
}

extension View {
    func rightAlighnedContent() -> some View {
        modifier(RightAlighnedContent())
    }
    
    func setShadow() -> some View {
        modifier(SetShadow())
    }
    
    func propotionalFrame(width: CGFloat, height: CGFloat, isSquared: Bool = false, alignment: Alignment = .center) -> some View {
        let finalWidth = UIScreen.main.bounds.width * width
        let finalHeight = isSquared ? finalWidth : UIScreen.main.bounds.height * height
        return frame(width: finalWidth, height: finalHeight)
    }
}

struct RightAlighnedContent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 30, height: 30)
            .foregroundColor(Color.indigo)
    }
}

struct SetShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .gray, radius: 5, x: 3, y: 3)
    }
}


struct ToDoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoHomeView()
    }
}
