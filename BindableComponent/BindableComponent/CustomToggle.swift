//
//  CustomToggle.swift
//  BindableComponent
//
//  Created by Thomas Dobson on 3/5/25.
//

import SwiftUI

// A custom toggle component that binds to a Boolean value.
// This component can be reused in other parts of the app.
struct CustomToggle: View {
    // A binding to a Boolean value that the toggle will control.
    @Binding var toggleState: Bool

    var body: some View {
        // A horizontal stack that places a label next to the toggle.
        HStack {
            // The label for the toggle.
            Text("Make it Rain")
            // A toggle control linked to the bound `toggleState`.
            Toggle("", isOn: $toggleState)
            .toggleStyle(.switch) // Uses the default switch style.
            .labelsHidden() // Hides the default label.
        }
        .padding() // Adds padding around the entire toggle row.
    }
}

// A preview provider for the CustomToggle component.
#Preview {
    @Previewable @State var previewToggleState = false

    return CustomToggle(toggleState: $previewToggleState)
}
