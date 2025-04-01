//
//  ContentView.swift
//  PhaseBell
//
//  Created by Thomas Dobson on 3/31/25.
//
//  This file contains the main view and an enum to handle animation phases
//  for a bell notification button using SwiftUI.
//
//  The button toggles the notification state, and the image animates through
//  several phases defined by the NotifyAnimationPhase enum.
//
import SwiftUI

/// The main content view that provides the notification button and animated bell.
///
/// This view consists of a horizontal stack containing:
/// - A button to toggle the notification state.
/// - An image (bell icon) that animates according to the specified phases.
struct ContentView: View {
    /// State variable to track whether the notification is triggered.
    @State private var isNotified = false

    /// The body property describes the view's layout and behavior.
    var body: some View {
        HStack(spacing: 20) {
            // Button that toggles the notification state.
            Button("Notify Me") {
                isNotified.toggle()
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .fontWeight(.semibold)
            .controlSize(.large)
            // The commented-out phaseAnimator code below serves as an example for
            // animating the button itself with scaling. It is currently inactive.
            // .phaseAnimator([true, false]) { content, phase in
            //     content
            //         .scaleEffect(phase ? 1.2 : 1.0)
            // } animation: { phase in
            //         .spring(duration: 0.5)
            // }

            // Image of a bell icon with attached animation defined by multiple phases.
            Image(systemName: "bell")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundStyle(.orange)
                // phaseAnimator is used here to animate the bell through a series of phases.
                // The sequence of phases is defined by the NotifyAnimationPhase enum.
                .phaseAnimator([NotifyAnimationPhase.initial,
                                NotifyAnimationPhase.lift,
                                NotifyAnimationPhase.shakeLeft,
                                NotifyAnimationPhase.shakeRight,
                                NotifyAnimationPhase.shakeLeft,
                                NotifyAnimationPhase.shakeRight
                               ],
                               trigger: isNotified
                ) { content, phase in
                    // Each phase adjusts the scale, rotation, and vertical offset.
                    content
                        .scaleEffect(phase.scale)
                        .rotationEffect(.degrees(phase.rotationDegrees), anchor: .top)
                        .offset(y: phase.yOffset)
                } animation: { phase in
                    // Select the animation type based on the current phase.
                    switch phase {
                    case .initial, .lift: .spring(bounce: 0.5)
                    case .shakeLeft, .shakeRight: .easeInOut(duration: 0.15)
                    }
                }
        }
        .padding()
    }
}

/// Enum representing the different animation phases for the notification animation.
///
/// Each case defines specific transformation values for the animation
/// such as scale, rotation, and vertical offset.
enum NotifyAnimationPhase: CaseIterable {
    case initial, lift, shakeLeft, shakeRight

    /// The vertical offset applied during this animation phase.
    var yOffset: CGFloat {
        switch self {
        case .initial: 0
        case .lift: -30
        case .shakeLeft: -30
        case .shakeRight: -30
        }
    }

    /// The scale factor applied during this animation phase.
    var scale: CGFloat {
        switch self {
        case .initial: 1
        case .lift: 1.2
        case .shakeLeft: 1.2
        case .shakeRight: 1.2
        }
    }

    /// The rotation in degrees applied during this animation phase.
    var rotationDegrees: Double {
        switch self {
        case .initial: 0
        case .lift: 0
        case .shakeLeft: -30
        case .shakeRight: 30
        }
    }
}

#Preview {
    ContentView()
}
