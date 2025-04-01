//
//  ContentView.swift
//  PhaseBell
//
//  Created by Thomas Dobson on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNotified = false
    var body: some View {
        HStack(spacing: 20) {
            Button("Notify Me") {
                isNotified.toggle()
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .fontWeight(.semibold)
            .controlSize(.large)
//            .phaseAnimator([true, false]) { content, phase in
//                content
//                    .scaleEffect(phase ? 1.2 : 1.0)
//            } animation: { phase in
//                    .spring(duration: 0.5)
//            }
            
            Image(systemName: "bell")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundStyle(.orange)
                .phaseAnimator([NotifyAnimationPhase.initial,
                                NotifyAnimationPhase.lift,
                                NotifyAnimationPhase.shakeLeft,
                                NotifyAnimationPhase.shakeRight,
                                NotifyAnimationPhase.shakeLeft,
                                NotifyAnimationPhase.shakeRight
                               ],
                               trigger: isNotified
                ) { content, phase in
                    content
                        .scaleEffect(phase.scale)
                        .rotationEffect(.degrees(phase.rotationDegrees), anchor: .top)
                        .offset(y: phase.yOffset)
                } animation: { phase in
                    switch phase {
                    case .initial, .lift: .spring(bounce: 0.5)
                    case .shakeLeft, .shakeRight: .easeInOut(duration: 0.15)
                    }
                }
        }
        .padding()
    }
}

enum NotifyAnimationPhase: CaseIterable {
    case initial, lift, shakeLeft, shakeRight
    
    var yOffset: CGFloat {
        switch self {
        case .initial: 0
        case .lift: -30
        case .shakeLeft: -30
        case .shakeRight: -30
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .initial: 1
        case .lift: 1.2
        case .shakeLeft: 1.2
        case .shakeRight: 1.2
        }
    }
    
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
