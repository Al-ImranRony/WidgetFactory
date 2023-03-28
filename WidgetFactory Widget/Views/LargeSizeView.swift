//
//  LargeSizeView.swift
//  WidgetFactory WidgetExtension
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import SwiftUI
import WidgetKit


struct LargeSizeView: View {
    var entry: SimpleEntry

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text("My todos")
                
                Text(Date.now, format: .dateTime)
                
                Spacer()
            }
            .padding(8)
            .background(.brown)
            .foregroundColor(.white)
            .clipped()
            .shadow(radius: 5)
            
            ForEach(0..<10, id: \.self) { _ in
                HStack {
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 30, height: 30)
                        .overlay {
                            if true {
                                Image(systemName: "checkmark")
                            }
                        }
                    Text("Todo Title")
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider() 
            }
        }
    }
}
