//
//  ContentView.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 3/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    @State var todos: [TodoItem] = []
    @State var selectedTodo: TodoItem?
    
    var body: some View {
        VStack {
            if !self.isActive {
                SplashView()
            }
            else {
                TodoView()
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
