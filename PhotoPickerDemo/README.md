# PhotoPickerDemo

## Overview
**PhotoPickerDemo** is a SwiftUI project demonstrating the use of `PhotosPicker` for selecting images from the photo library. It includes both single and multiple photo selection functionalities using SwiftUI's `PhotosUI` framework.

## Features
- Implements a `SinglePhotoPicker` for selecting one image.
- Implements a `MultiPhotoPicker` for selecting multiple images.
- Uses `PhotosPicker` to access images from the photo library.
- Displays selected images using SwiftUI's `Image` view.
- Utilizes async/await to handle image loading.

## Code Breakdown

### 📸 Implementing Single Photo Selection
The `SinglePhotoPicker` allows users to pick one image from their library:

```swift
struct SinglePhotoPicker: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var image: Image?
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                (image ?? Image(systemName: "photo.artframe"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .padding(.bottom, 40)
            }
            .onChange(of: selectedItem) {
                Task {
                    if let newImage = try? await selectedItem?.loadTransferable(type: Image.self) {
                       image = newImage
                    } else {
                        print("failed")
                    }
                }
            }
            
            Text("Upload an Image")
        }
    }
}
```

### 📷 Implementing Multi-Photo Selection
The `MultiPhotoPicker` allows users to pick multiple images:

```swift
struct MultiPhotoPicker: View {
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<selectedImages.count, id: \.self) { i in
                        selectedImages[i]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
            }
            .toolbar {
                PhotosPicker("Select Image", selection: $selectedItems, matching: .images)
            }
            .onChange(of: selectedItems) {
                Task {
                    selectedImages.removeAll()
                    
                    for item in selectedItems {
                        if let image = try? await item.loadTransferable(type: Image.self) {
                            selectedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}
```

### 🔄 Implementing a TabView for Easy Navigation
The `ContentView` provides a `TabView` to switch between single and multi-photo pickers:

```swift
struct ContentView: View {
    var body: some View {
        TabView {
            Tab("SinglePhoto", systemImage: "photo") {
                SinglePhotoPicker()
            }
            Tab("MultiPhoto", systemImage: "photo") {
                MultiPhotoPicker()
            }
        }
    }
}
```

### 🖥️ Previewing the UI
Xcode previews allow testing of `ContentView`, `SinglePhotoPicker`, and `MultiPhotoPicker`:

```swift
#Preview {
    ContentView()
}

#Preview {
    SinglePhotoPicker()
}

#Preview {
    MultiPhotoPicker()
}
```

## How to Run
1. Open **PhotoPickerDemo.xcodeproj** in Xcode.
2. Select an iOS simulator or device.
3. Run the project (`Cmd + R`) to test photo selection functionality.

## Notes
- `PhotosPicker` is part of `PhotosUI`, simplifying image selection.
- The use of `async/await` ensures smooth image loading.
- `LazyVStack` optimizes multiple image display in `MultiPhotoPicker`.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
