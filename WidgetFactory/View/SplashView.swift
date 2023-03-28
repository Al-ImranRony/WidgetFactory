//
//  SplashView.swift
//  WidgetFactory
//
//  Created by Bitmorpher 4 on 3/23/23.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        VStack {
            Image("personalIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundColor(.brown)
            VStack(spacing: 5.0) {
                Text("Widget Factory")
                Text("By")
                Text("Rony")
                    .foregroundColor(.gray )
            }
            .padding()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
