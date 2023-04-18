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
            
        case .accessoryInline:
            Text(entry.todos.first?.todo ?? "No Todos Today")
            
        case .accessoryCircular:
            Gauge(value: 0.7) {
                Text(entry.date, format: .dateTime.month())
            }
            .gaugeStyle(.accessoryCircular)
            
        case .accessoryRectangular:
            Gauge(value: 0.7) {
                Text(entry.date, format: .dateTime.dayOfYear())
            }
            .gaugeStyle(.accessoryLinear)
            
        default:
            Text(entry.date, style: .time)
        }
    }
}
