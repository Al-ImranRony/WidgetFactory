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
                
                VStack(alignment: .leading) {
                    Text("Todo Title")
                        .font(.headline)
                    Text("Completed")
                        .font(.subheadline)
                }
            
                Spacer()
            }
            .padding()
        } label: {
            Label("My todos", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "widgetfactory://todo/1"))
    }
}

