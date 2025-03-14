# CarouselView

## Overview
**CarouselView** is a SwiftUI project demonstrating how to create a horizontally scrolling workout selection interface. Each workout is represented by a card containing an SF Symbol and a workout name.

![CarouselVIew](https://github.com/user-attachments/assets/71e885dd-b96f-4486-9aff-f59372287c6b)

## Features
- Uses `ScrollView(.horizontal)` for smooth horizontal scrolling.
- Implements `ZStack` to overlay content inside each card.
- Uses SF Symbols to visually represent workouts.
- Displays structured workout cards inside an `HStack`.

## Code Breakdown

### 🔄 Defining the Workout Data
A `WorkOut` struct defines each workout with a name and an SF Symbol:

```swift
struct WorkOut: Hashable {
    var name: String
    var symbol: String
}
```

### 📋 Managing the Workout List
A private array of `WorkOut` objects provides predefined workout options:

```swift
private var workOuts: [WorkOut] = [
    WorkOut(name: "Walking", symbol: "figure.walk"),
    WorkOut(name: "Running", symbol: "figure.run"),
    WorkOut(name: "Boxing", symbol: "figure.boxing"),
    WorkOut(name: "Core", symbol: "figure.core.training"),
    WorkOut(name: "Stretching", symbol: "figure.cooldown"),
    WorkOut(name: "Cross Training", symbol: "figure.cross.training"),
    WorkOut(name: "Dance", symbol: "figure.dance"),
    WorkOut(name: "Hiking", symbol: "figure.hiking"),
    WorkOut(name: "Cycle", symbol: "figure.indoor.cycle"),
    WorkOut(name: "Yoga", symbol: "figure.mind.and.body")
]
```

### 🏗️ Structuring the CarouselView
A `ScrollView(.horizontal)` enables horizontal scrolling:

```swift
ScrollView(.horizontal) {
    HStack {
        ForEach(workOuts, id: \.self) { workOut in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemCyan))
                    .frame(width: 200, height: 200)
                VStack {
                    Image(systemName: "\(workOut.symbol)")
                        .font(.system(size: 70))
                        .foregroundStyle(.white)
                    Text("\(workOut.name)")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}
.padding()
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `CarouselView`:

```swift
#Preview {
    CarouselView()
}
```

## How to Run
1. Open **CarouselView.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) and scroll horizontally to view the workouts.

## Notes
- `ScrollView(.horizontal)` ensures smooth scrolling through workout cards.
- `RoundedRectangle` provides a visually appealing background for each card.
- SF Symbols are used to visually represent different workout types.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
