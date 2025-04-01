# PhaseBell

## Overview
**PhaseBell** is a SwiftUI animation demo that showcases how to use `phaseAnimator` to animate a bell icon in response to user interaction. This project demonstrates how to sequence complex animations through custom enum phases.

## Features
- 🔔 Animated bell icon using SwiftUI’s `phaseAnimator`
- 🌀 Multiple animation phases: lift, shake left, shake right
- 🎯 Button trigger for starting the animation
- 🧱 Custom `enum` to define animation phase parameters
- 🚀 Smooth, phase-based transitions using `spring` and `easeInOut`

## Animation Flow
When the user taps the **Notify Me** button, the app:
1. Lifts the bell upward
2. Shakes the bell left and right a few times
3. Returns to the initial state

The motion mimics a ringing bell using transform values: `scale`, `rotation`, and `offset`.

## Components

### ContentView
- Contains:
  - A prominent **Notify Me** button
  - A bell icon (`Image(systemName: "bell")`)
- The bell image uses `.phaseAnimator(...)` triggered by `@State var isNotified`

### NotifyAnimationPhase Enum
Defines how each phase of the animation behaves:
- `initial`: Default state
- `lift`: Bell lifts slightly
- `shakeLeft` / `shakeRight`: Bell rotates to simulate ringing

Each phase returns values for:
- `yOffset`
- `scale`
- `rotationDegrees`

## Key Concepts
- `phaseAnimator`: Animates a view through a sequence of states
- SwiftUI `.spring()` and `.easeInOut` animations
- Custom `enum` to encapsulate animation data per phase

## How to Run
1. Open `PhaseBell.xcodeproj` in Xcode.
2. Run on iOS 17+ simulator or device (requires `phaseAnimator` support).
3. Tap **"Notify Me"** to animate the bell icon.

## Preview Support
Includes a working `#Preview` for testing in Xcode Canvas.

---

🧠 *Part of the Daily Swift Tasks learning journey.*
