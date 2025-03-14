//
//  BottomSheet.swift
//  BottomSheet
//
//  Created by Thomas Dobson on 3/14/25.
//

import SwiftUI

// BottomSheet is a reusable view representing a bottom sheet that slides up from the bottom of the screen.
// It can be dismissed by dragging it downward. Its visibility is controlled by the `isPresented` binding.
struct BottomSheet: View {
    // A binding that indicates whether the bottom sheet should be visible.
    // The parent view controls this value.
    @Binding var isPresented: Bool
    
    // A state variable that tracks the current vertical drag offset.
    // This value is updated continuously as the user drags the sheet.
    @State private var dragOffset: CGFloat = 0

    var body: some View {
        ZStack {
            // The main visual content of the bottom sheet.
            // A RoundedRectangle provides the background for the sheet.
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray6))   // Fill with a light gray color.
                .frame(width: 300, height: 300) // Fixed width and height.
                .overlay(
                    // Overlay adds a border to the bottom sheet.
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            // Additional content is layered on top of the background.
            VStack {
                // Title text for the sheet.
                Text("Extra Details")
                    .font(.largeTitle)
                    .padding(.bottom, 10) // Space below the title.
                // Detailed description text.
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    .multilineTextAlignment(.center) // Center the text.
                    .padding(.horizontal, 60)  // Add horizontal padding to keep text from touching edges.
                    .font(.caption) // Use a smaller font for the detailed text.
            }
        }
        // The sheet's vertical offset:
        // When isPresented is true, the sheet is positioned at 250 points from the top plus any active drag offset.
        // When isPresented is false, the sheet is moved off-screen (at 800 points).
        .offset(y: isPresented ? (250 + dragOffset) : 800)
        // Attach a DragGesture to allow the user to interact with the sheet.
        .gesture(
            DragGesture()
                .onChanged { value in
                    // Continuously update the dragOffset as the user drags.
                    // The drag's vertical translation is stored in dragOffset.
                    dragOffset = value.translation.height
                }
                .onEnded { value in
                    // When the drag gesture ends, evaluate the final vertical translation.
                    if value.translation.height > 100 {
                        // If the user dragged the sheet downward more than 100 points,
                        // animate the sheet moving further down (off-screen) by updating dragOffset to 800.
                        withAnimation(.easeInOut(duration: 0.5)) {
                            dragOffset = 800
                        }
                        // Use Swift concurrency to wait for 0.5 seconds before dismissing the sheet.
                        Task {
                            try? await Task.sleep(nanoseconds: 500_000_000)
                            withAnimation(.easeInOut(duration: 0.5)) {
                                // Dismiss the sheet by setting isPresented to false.
                                isPresented = false
                                // Reset dragOffset for the next time the sheet is presented.
                                dragOffset = 0
                            }
                        }
                    } else {
                        // If the drag distance is less than 100 points,
                        // animate the sheet snapping back to its open position (reset dragOffset to 0).
                        withAnimation(.easeInOut(duration: 0.5)) {
                            dragOffset = 0
                        }
                    }
                }
        )
    }
}

// Interactive preview for BottomSheet using the new @Previewable macro.
// A local @State variable is created to toggle the sheet, so you can test its behavior in Xcode's preview canvas.
#Preview {
    @Previewable @State var showSheet: Bool = false
    BottomSheet(isPresented: $showSheet)
}
