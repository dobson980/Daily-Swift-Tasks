# CustomViewWithDynamicData

## Overview
**CustomViewWithDynamicData** is a SwiftUI project that demonstrates how to create and display dynamic data in reusable custom views. The project features a simple user list with avatars, names, and email addresses, using SwiftUI components efficiently.

<img width="329" alt="image" src="https://github.com/user-attachments/assets/abe87b78-a777-4ce2-add2-be42239d726f" />

## Features
- Defines a `User` model with identifiable properties.
- Implements a reusable `UserView` for displaying user details.
- Uses `ScrollView` and `ForEach` to iterate over a list of users.
- Applies SF Symbols for user avatars.
- Enhances UI with padding, rounded backgrounds, and shadows.

## Code Breakdown

### 📌 Defining the User Model
The `User` struct stores essential user details and includes a computed property to return an SF Symbol image:

```swift
struct User: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var avatar: String
    var avatarIcon: Image {
        return Image(systemName: avatar)
    }
}
```

### 🏗️ Creating a Reusable UserView
The `UserView` is a SwiftUI component that presents a user’s avatar, name, and email with a clean and modern design:

```swift
struct UserView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 16) {
            user.avatarIcon
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(user.name)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.accentColor)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}
```

### 🔄 Displaying Multiple Users in ContentView
The `ContentView` iterates through a predefined list of users and displays them in a scrollable layout:

```swift
struct ContentView: View {
    var users: [User] = [
        User(name: "Rick James", email: "Rick.James@yahoo.com", avatar: "guitars.fill"),
        User(name: "Jane Doe", email: "Jane.Doe@gmail.com", avatar: "arcade.stick.console.fill"),
        User(name: "Moe Mira", email: "mmira@gmail.com", avatar: "xbox.logo")
    ]
    
    var body: some View {
        ScrollView {
            ForEach(users) { user in
                UserView(user: user)
            }
        }
        .padding()
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow easy testing of the `UserView` and `ContentView`:

```swift
#Preview {
    ContentView()
}

#Preview {
    UserView(user: User(name: "Jane Dog", email: "Jane.Dog@gmail.com", avatar: "xbox.logo"))
}
```

## How to Run
1. Open **CustomViewWithDynamicData.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to see dynamic user views in action.

## Notes
- SF Symbols are used for avatars, making customization easy.
- `ScrollView` ensures smooth navigation through user entries.
- Using a computed property (`avatarIcon`) simplifies icon handling.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
