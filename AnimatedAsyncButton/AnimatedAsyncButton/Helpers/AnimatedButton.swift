//
//  AnimatedButton.swift
//  AnimatedAsyncButton
//
//  Created by Thomas Dobson on 4/2/25.
//

import SwiftUI

/// An animated button view that displays a spinner during asynchronous tasks.
///
/// This view composes a button with a configuration for title, colors, optional symbol image,
/// and animations. When tapped, it toggles a loading state and executes the provided asynchronous action.
struct AnimatedButton: View {
    /// The configuration settings for the animated button.
    var config: Config
    
    /// The asynchronous action to execute on button tap.
    var onTap: () async -> ()
    
    /// The shape used for the button's clipping. Defaults to a capsule shape.
    var shape: AnyShape = .init(.capsule)
    
    /// A state flag indicating whether the button shows a loading spinner.
    @State private var isLoading: Bool = false
    
    /// The main content of the animated button.
    ///
    /// The view consists of a Button that toggles the `isLoading` flag before and after the execution
    /// of the asynchronous `onTap` action. The label inside the button displays:
    /// - An optional symbol image, if configured.
    /// - A spinner, if the button is in a loading state.
    /// - The button title text.
    var body: some View {
        Button {
            Task {
                isLoading.toggle()
                await onTap()
                isLoading.toggle()
            }
        } label: {
            HStack(spacing: 10) {
                // Display a symbol image if it exists in the configuration.
                if let symbolImage = config.symbolImage {
                    Image(systemName: symbolImage)
                        .font(.title3)
                        .transition(.blurReplace)
                } else {
                    // Show the spinner when in loading state.
                    if isLoading {
                        Spinner(tint: config.foregroundColor, lineWidth: 4)
                            .frame(width: 20, height: 20)
                            .transition(.blurReplace)
                    }
                }

                // Display the button title.
                Text(config.title)
                    .contentTransition(.interpolate)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, config.horizontalPadding)
            .padding(.vertical, config.verticalPadding)
            .foregroundColor(config.foregroundColor)
            .background(config.backgroundColor.gradient)
            .clipShape(shape)
            .contentShape(shape)
        }
        // Disable the button while loading.
        .disabled(isLoading)
        .buttonStyle(ScaleButtonStyle())
        // Apply animations on configuration and loading state changes.
        .animation(config.animation, value: config)
        .animation(config.animation, value: isLoading)
    }
    
    /// A configuration struct for the AnimatedButton.
    ///
    /// This struct holds properties for customizing the appearance and animations of the button.
    struct Config: Equatable {
        /// The text to display on the button.
        var title: String
        
        /// The color applied to the button's foreground elements.
        var foregroundColor: Color
        
        /// The background color of the button.
        var backgroundColor: Color
        
        /// An optional system image name to display alongside the title.
        var symbolImage: String?
        
        /// The horizontal padding applied to the button content.
        var horizontalPadding: CGFloat = 15
        
        /// The vertical padding applied to the button content.
        var verticalPadding: CGFloat = 10
        
        /// The animation used when state transitions occur.
        var animation: Animation = .easeInOut(duration: 0.25)
    }
}

/// A custom button style that scales the button when pressed.
///
/// This style provides a visual feedback by reducing the button's scale when it is in the pressed state.
struct ScaleButtonStyle: ButtonStyle {
    /// Creates a view that scales based on the button's pressed state.
    ///
    /// - Parameter configuration: The current state and label for the button.
    /// - Returns: A view modified with a scaling animation.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .animation(.linear(duration: 0.2)) {
                $0
                    .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            }
    }
}

/// A preview provider for the AnimatedButton view.
///
/// This preview sets up the AnimatedButton with a white foreground and a black background.
#Preview {
    AnimatedButton(
        config: AnimatedButton.Config(
            title: "Click to Pay",
            foregroundColor: .white,
            backgroundColor: .black
        ),
        onTap: {
            print("Button tapped")
        }
    )
}
