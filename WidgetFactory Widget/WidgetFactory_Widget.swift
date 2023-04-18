//
//  WidgetFactory_Widget.swift
//  WidgetFactory Widget
//
//  Created by Bitmorpher 4 on 3/26/23.
//

import WidgetKit
import SwiftUI

@main
struct WidgetFactory_Widget: Widget {
    let kind: String = "WidgetFactory_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge, .accessoryInline, .accessoryCircular, .accessoryRectangular])
        .configurationDisplayName("My Todo Tasks")
        .description("Explore your latest todo(s).")
    }
}

struct WidgetFactory_Widget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date(), todos: [.placeholder(id: 0), .placeholder(id: 1)]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
