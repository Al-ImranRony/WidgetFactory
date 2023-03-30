//
//  WidgetView.swift
//  WidgetFactory WidgetExtension
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import WidgetKit
import SwiftUI

struct WidgetView : View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemLarge:
            LargeSizeView(entry: entry)
        case .systemMedium:
            MediumSizeView(entry: entry)
        default:
            Text(entry.date, style: .time)
        }
    }
}
